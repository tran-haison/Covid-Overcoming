import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_overcoming/config/log/logger.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreService {
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> deleteData({
    required String path,
  });

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  });

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  });
}

@LazySingleton(as: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    Log.d('$path: $data');
    await reference.set(data);
  }

  @override
  Future<void> deleteData({
    required String path,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    Log.d('Delete: $path');
    await reference.delete();
  }

  @override
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

  @override
  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final reference = _firebaseFirestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
}
