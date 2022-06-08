import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/utils/firestore_path.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreDatabaseService {
  Future<void> saveUser(UserModel userModel);

  Future<UserModel> getUser(String uid);

  Future<bool> checkUserExists(String uid);
}

@LazySingleton(as: FirestoreDatabaseService)
class FirestoreDatabaseServiceImpl implements FirestoreDatabaseService {
  FirestoreDatabaseServiceImpl(this._baseService);

  final FirestoreBaseService _baseService;

  @override
  Future<void> saveUser(UserModel userModel) async {
    await _baseService.setData(
      path: FirestorePath.user(userModel.uid),
      data: userModel.toJson(),
    );
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final data = await _baseService.getData(
      path: FirestorePath.user(uid),
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<bool> checkUserExists(String uid) async {
    return await _baseService.checkDataExists(
      path: FirestorePath.user(uid),
    );
  }
}
