import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_paths.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreDatabaseService {
  Future<void> saveUser(UserModel userModel);

  Future<UserModel> getUser(String uid);

  Future<bool> checkUserExists(String uid);
}

@LazySingleton(as: FirestoreDatabaseService)
class FirestoreDatabaseServiceImpl implements FirestoreDatabaseService {
  FirestoreDatabaseServiceImpl(this.baseService);

  final FirestoreBaseService baseService;

  @override
  Future<void> saveUser(UserModel userModel) async {
    await baseService.setData(
      path: FirestorePaths.user(userModel.uid),
      data: userModel.toJson(),
    );
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final data = await baseService.getData(
      path: FirestorePaths.user(uid),
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<bool> checkUserExists(String uid) async {
    return await baseService.checkDataExists(
      path: FirestorePaths.user(uid),
    );
  }
}
