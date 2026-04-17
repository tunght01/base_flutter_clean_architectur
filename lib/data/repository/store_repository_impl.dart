import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/model/account_info_model.dart';
import 'package:soft_dream_test/data/repository/source/firebase/auth_datasource.dart';
import 'package:soft_dream_test/data/repository/source/firebase/cloud_store_data_source.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/domain/entities/request/create_user_request.dart';
import 'package:soft_dream_test/domain/mapper/account_info_mapper.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/shared/constants/data_constant.dart';

@LazySingleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final CloudStoreDataSource _cloudStoreDataSource;
  final AuthDatasource _authDatasource;
  final AccountInfoMapper _accountInfoMapper;

  StoreRepositoryImpl(
    this._authDatasource,
    this._accountInfoMapper,
    this._cloudStoreDataSource,
  );

  @override
  Future<AccountInfo?> getUserProfile(String uid) async {
    final response = await _cloudStoreDataSource.getDocument(
      collectionPath: DataConstant.userCollection,
      docId: uid,
    );

    if (response != null) {
      final model = AccountInfoModel.fromJson(response);
      return _accountInfoMapper.mapToEntity(model);
    }
    return null;
  }

  @override
  Future<void> saveUserProfile(CreateUserRequest account) async {
    final currentUser = _authDatasource.currentUser;
    final isEmailVerified = currentUser?.emailVerified ?? false;

    if (currentUser?.uid != null) {
      final data = account.copyWith(
        uid: currentUser?.uid,
        emailVerified: isEmailVerified,
      );

      final payload = data.toJson();


      await _cloudStoreDataSource.setData(
        collectionPath: DataConstant.userCollection,
        docId: currentUser!.uid,
        data: payload,
      );
    }
  }
}
