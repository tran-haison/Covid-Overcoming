import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_paths.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreDatabaseService {
  Future<void> saveAccount(AccountModel accountModel);

  Future<AccountModel> getAccount(String uid);

  Future<bool> checkAccountExists(String uid);
}

@LazySingleton(as: FirestoreDatabaseService)
class FirestoreDatabaseServiceImpl implements FirestoreDatabaseService {
  FirestoreDatabaseServiceImpl(this.baseService);

  final FirestoreBaseService baseService;

  @override
  Future<void> saveAccount(AccountModel accountModel) async {
    await baseService.setData(
      path: FirestorePaths.account(accountModel.uid),
      data: accountModel.toJson(),
    );
  }

  @override
  Future<AccountModel> getAccount(String uid) async {
    final data = await baseService.getData(
      path: FirestorePaths.account(uid),
    );
    return AccountModel.fromJson(data);
  }

  @override
  Future<bool> checkAccountExists(String uid) async {
    return await baseService.checkDataExists(
      path: FirestorePaths.account(uid),
    );
  }
}
