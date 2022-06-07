import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/utils/firestore_path.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreDatabaseService {}

@LazySingleton(as: FirestoreDatabaseService)
class FirestoreDatabaseServiceImpl implements FirestoreDatabaseService {
  Stream<List<UserModel>> getUsersStream() {
    return FirestoreBase.collectionStream(
      path: FirestorePath.users,
      builder: (data, documentId) {
        // TODO: check
        return UserModel.fromJson(data);
      },
    );
  }
}
