import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:soft_dream_test/hive_registrar.g.dart';
import 'package:soft_dream_test/shared/constants/hive_constant.dart';
import 'di.config.dart';
import 'package:soft_dream_test/data/repository/source/database/hive/model/product_hive_model.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @LazySingleton()
  FirebaseAuth get fireAuth => FirebaseAuth.instance..setLanguageCode('vi');

  @LazySingleton()
  FirebaseFirestore get fireStore => FirebaseFirestore.instance;

  @LazySingleton()
  GoogleSignIn get google => GoogleSignIn.instance;



  @preResolve
  Future<Box<ProductHiveModel>> provideHiveDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    return await Hive.openBox<ProductHiveModel>(HiveConstant.productBox);
  }
}

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
