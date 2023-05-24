import 'package:apptester/src/features/login/data/repositories/api_nodejs/login_repositoryImpl.dart';
import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../firebaseservice.dart';
import '../../../utils/user_secure__storage.dart';
import '../../../utils/user_shared_preferences.dart';
import '../../home/presentations/home_Screen.dart';
import '../../register/presentation/register_Screen.dart';

import 'bloc/post_login/post_login_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  User? result = FirebaseAuth.instance.currentUser;
  //late RequestLoginModel requestLoginModel;

  @override
  void dispose() {
    email.dispose(); // ยกเลิกการใช้งานที่เกี่ยวข้องทั้งหมดถ้ามี
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: email,
                validator: (value) =>
                    value!.isEmpty ? 'Input cannot be empty!' : null,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // เมื่อ focus
                    borderSide: BorderSide(width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // สถานะปกติ
                    borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: password,
                validator: (value) =>
                    value!.isEmpty ? 'Input cannot be empty!' : null,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // เมื่อ focus
                    borderSide: BorderSide(width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // สถานะปกติ
                    borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            BlocListener<PostLoginBloc, PostLoginState>(
              listener: (context, state) async {
                // TODO: implement listener
                if (state is PostLoginErrorState) {
                  Navigator.of(context).pop();
                  final snackBar = SnackBar(content: Text(state.status));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (state is PostLoginSuccessState) {
                  String? token = state.data.accessToken;

                  await UserSecureStorage.setToken(token!);
                  await UserSharedPreferences.setUsername(state.data.username);
                  await UserSharedPreferences.setEmail(state.data.email);
                  await UserSharedPreferences.setAddress(state.data.address);
                  await UserSharedPreferences.setCountry(state.data.country);
                  await UserSharedPreferences.setAvartar(state.data.avartar);
                  await UserSharedPreferences.setRoles(state.data.roles);
                  await UserSharedPreferences.setId(state.data.id);

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Login Success!"),
                  ));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }
                if (state is PostLoginLoadingState) {
                  _Loading(context);
                }
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print('Form Complete');
                      _formKey.currentState!.save();
                      // String pw = password.text;
                      // final requestLoginModel =
                      //     RequestLoginModel(username: email.text, password: pw);
                      // requestLoginModel.username = username.text;
                      // requestLoginModel.password = password.text;
                      FirebaseService service = new FirebaseService();
                      service.signInwithEmailPassword(
                          email.text, password.text);
                      // context
                      //     .read<PostLoginBloc>()
                      //     .add(LoginEvent(requestLoginModel));
                    }
                  },
                  child: const Text(
                    'Login with Email/Password',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            const Text(
              "don't have an account",
              style: TextStyle(fontSize: 15),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {},
                child: const Text(
                  'Login with Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  FirebaseService service = new FirebaseService();
                  try {
                    await service.signInwithGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                        (Route<dynamic> route) => false);
                  } catch (e) {
                    if (e is FirebaseAuthException) {
                      print(e.message!);
                    }
                  }
                },
                child: const Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _Loading(BuildContext context) async {
  // show the loading dialog
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}
