import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/data/utils/shared_pref_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:sp_util/sp_util.dart';

abstract class AppPref {
  Future<void> saveFirstTimeInit(bool isFirstTime);

  Future<bool> getFirstTimeInit();

  Future<void> saveUser(UserModel userModel);

  Future<UserModel> getUser();
}

@LazySingleton(as: AppPref)
class AppPrefImpl implements AppPref {
  @override
  Future<void> saveFirstTimeInit(bool isFirstTime) async {
    await SpUtil.putBool(SharedPrefKeys.firstTimeInit, isFirstTime);
  }

  @override
  Future<bool> getFirstTimeInit() async {
    return SpUtil.getBool(SharedPrefKeys.firstTimeInit, defValue: true) ?? true;
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    await SpUtil.putObject(SharedPrefKeys.user, userModel.toJson());
  }

  @override
  Future<UserModel> getUser() async {
    final data =
        SpUtil.getObject(SharedPrefKeys.user) as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }
}
