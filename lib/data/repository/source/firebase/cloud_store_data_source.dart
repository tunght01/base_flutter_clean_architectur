import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CloudStoreDataSource {
  final FirebaseFirestore _fireStore;

  CloudStoreDataSource(this._fireStore);

  Future<void> setData({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(collectionPath).doc(docId).set(data);
  }

  Future<String> addData({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final docRef = await _fireStore.collection(collectionPath).add(data);
    return docRef.id;
  }

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docId,
  }) async {
    final snapshot = await _fireStore
        .collection(collectionPath)
        .doc(docId)
        .get();
    if (snapshot.exists && snapshot.data() != null) {
      return {'id': snapshot.id, ...snapshot.data()!};
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getCollection({
    required String collectionPath,
  }) async {
    final snapshot = await _fireStore.collection(collectionPath).get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<void> updateData({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(collectionPath).doc(docId).update(data);
  }

  Future<void> deleteData({
    required String collectionPath,
    required String docId,
  }) async {
    await _fireStore.collection(collectionPath).doc(docId).delete();
  }
}
