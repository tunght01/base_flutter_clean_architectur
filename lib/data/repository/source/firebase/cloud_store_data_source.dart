import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CloudStoreDataSource {
  final FirebaseFirestore _fireStore;

  CloudStoreDataSource(this._fireStore);
}
