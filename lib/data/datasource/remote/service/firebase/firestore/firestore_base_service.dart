import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_overcoming/config/log/logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreBaseService {
  static final _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    Log.d('$path: $data');
    await reference.set(data);
  }

  Future<Map<String, dynamic>> getData({
    required String path,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    final snapshot = await reference.get();
    final data = snapshot.data() as Map<String, dynamic>;
    Log.d('$path: $data');
    return data;
  }

  Future<void> deleteData({
    required String path,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    Log.d('Delete: $path');
    await reference.delete();
  }

  Future<bool> checkDataExists({
    required String path,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    final snapshot = await reference.get();
    return snapshot.exists;
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(
                snapshot.data() as Map<String, dynamic>,
                snapshot.id,
              ))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final reference = _firebaseFirestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
}
