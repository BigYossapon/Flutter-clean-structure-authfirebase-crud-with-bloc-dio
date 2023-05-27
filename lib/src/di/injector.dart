import 'package:apptester/src/di/injector.config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

//Define the Environments here
const dev = Environment('dev');
const prod = Environment('prod');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({Environment environment = dev}) async {
  //we init the dependencies using a speciffic env
  await $initGetIt(getIt, environment: environment.name);
}

@module
abstract class AppModule {
  // ....
  @injectable
  FirebaseFirestore get store => FirebaseFirestore.instance;

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;
}
