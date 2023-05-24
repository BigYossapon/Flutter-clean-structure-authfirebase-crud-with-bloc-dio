import 'package:apptester/src/features/login/presentation/login_Layout.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:apptester/src/utils/user_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../home/presentations/home_Screen.dart';
import '../login/presentation/login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;

    return result != null ? const HomeScreen() : const LoginScreen();
  }
}
