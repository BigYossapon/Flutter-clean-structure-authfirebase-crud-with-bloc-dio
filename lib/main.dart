import 'package:apptester/src/di/injector.dart';
import 'package:apptester/src/features/home/presentations/home_Screen.dart';
import 'package:apptester/src/features/login/data/repositories/firebase/login_firebase_repositoryImpl.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/is_signin_usecase.dart';
import 'package:apptester/src/features/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:apptester/src/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:apptester/src/features/profile/presentation/profile_Screen.dart';
import 'package:apptester/src/features/splash/splash_Screen.dart';
import 'package:apptester/src/utils/app_bloc_observe.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await configureDependencies();

      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkloggedinBloc = BlocProvider<AuthBloc>(
        create: (context) => getIt<AuthBloc>()..add(AppStartedEvent()));
    return MaterialApp(
      title: 'Flutter Test Authen and crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

// gh.factory<AuthBloc>(() => AuthBloc(
//       getCurrentUidUseCase: gh.call(),
//       isSigninUseCase: gh.call(),
//       signInEmailPasswordUseCase: gh.call(),
//       signinFacebookUseCase: gh.call(),
//       signInGoogleUseCase: gh.call()));
//   gh.factory<ProfileBloc>(() => ProfileBloc(
//       createProfileUserCase: gh.call(),
//       deleteAccountUserCase: gh.call(),
//       deleteProfileUserCase: gh.call(),
//       editProfileUseCase: gh.call(),
//       getProfileUseCase: gh.call(),
//       signOutUseUseCase: gh.call()));
//   gh.factory<RegisterBloc>(
//       () => RegisterBloc(registerEmailPasswordUseCase: gh.call()));
//   //Cubit/Bloc
//   //useCase
//   gh.lazySingleton<GetCurrentUidUseCase>(
//       () => GetCurrentUidUseCase(loginFirebaseRepository: gh.call()));
//   gh.lazySingleton<IsSigninUseCase>(
//       () => IsSigninUseCase(loginFirebaseRepository: gh.call()));
//   gh.lazySingleton<SignInEmailPasswordUseCase>(
//       () => SignInEmailPasswordUseCase(loginFirebaseRepository: gh.call()));
//   gh.lazySingleton<SignInFacebookUseCase>(
//       () => SignInFacebookUseCase(loginFirebaseRepository: gh.call()));
//   gh.lazySingleton<SignInGoogleUseCase>(
//       () => SignInGoogleUseCase(loginFirebaseRepository: gh.call()));
//   gh.lazySingleton<CreateProfileUserCase>(
//       () => CreateProfileUserCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<DeleteAccountUserCase>(
//       () => DeleteAccountUserCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<DeleteProfileUserCase>(
//       () => DeleteProfileUserCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<GetProfileUseCase>(
//       () => GetProfileUseCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<EditProfileUseCase>(
//       () => EditProfileUseCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<SignoutUseCase>(
//       () => SignoutUseCase(profileFirebaseRepository: gh.call()));
//   gh.lazySingleton<RegisterEmailPasswordUseCase>(() =>
//       RegisterEmailPasswordUseCase(registerFirebaseRepository: gh.call()));

//   //repository
//   gh.lazySingleton<LoginFirebaseRepository>(
//       () => LoginFirebaseRepositoryImpl(loginFirebaseDataSource: gh.call()));
//   gh.lazySingleton<RegisterFirebaseRepository>(() =>
//       RegisterFirebaseRepositoryImpl(registerFirebaseDatasource: gh.call()));
//   gh.lazySingleton<ProfileFirebaseRepository>(() =>
//       ProfileFirebaseRepositoryImpl(profileFirebaseDataSource: gh.call()));

//   //data source
//   gh.lazySingleton<LoginFirebaseDataSource>(
//       () => LoginFirebaseDataSourceImpl(auth: gh.call(), firestore: gh.call()));
//   gh.lazySingleton<RegisterFirebaseDatasource>(() =>
//       RegisterFirebaseDatasourceImpl(auth: gh.call(), firestore: gh.call()));
//   gh.lazySingleton<ProfileFirebaseDataSource>(() =>
//       ProfileFirebaseDatasourceImpl(auth: gh.call(), firestore: gh.call()));

//   //External
//   final auth = FirebaseAuth.instance;
//   final fireStore = FirebaseFirestore.instance;

//   gh.lazySingleton(() => auth);
//   gh.lazySingleton(() => fireStore);
