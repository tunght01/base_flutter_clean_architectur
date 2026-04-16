import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Singleton()
  FirebaseAuth get fireAuth => FirebaseAuth.instance..setLanguageCode('vi');

  @Singleton()
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
