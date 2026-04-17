import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/firebase/cloud_store_data_source.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';

@LazySingleton(as: StoreRepository)
class AuthRepositoryImpl implements StoreRepository {
  final CloudStoreDataSource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<AccountInfo> getUserProfile(String uid) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<AccountInfo> saveUserProfile(AccountInfo account) async {

    final now = Timestamp.now();

    await _authDatasource.c("users").doc(account.uid).set({
      "uid": user.uid,
      "email": email,
      "fullName": fullName,
      "avatarUrl": null,
      "provider": "password",
      "emailVerified": user.emailVerified,
      "termsAcceptedAt": now,
      "createdAt": now,
      "updatedAt": now,
    });
  }
  }
}
