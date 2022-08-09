import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_paths.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreDatabaseService {
  Future<void> saveAccount(AccountModel accountModel);

  Future<AccountModel> getAccount(String uid);

  Future<bool> checkAccountExists(String uid);

  Stream<List<AccountModel>> getAccountsStream();

  Stream<List<AccountModel>> getAccountsStreamByRole(AccountRole role);

  Future<List<ExaminationQuestionModel>> getExaminationQuestions({
    required String id,
    required String questionType,
  });
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

  @override
  Stream<List<AccountModel>> getAccountsStream() {
    return baseService.collectionStream(
      path: FirestorePaths.accounts(),
      builder: (data, documentId) => AccountModel.fromJson(data),
    );
  }

  @override
  Stream<List<AccountModel>> getAccountsStreamByRole(AccountRole role) {
    return baseService.collectionStream(
      path: FirestorePaths.accounts(),
      queryBuilder: (query) => query.where(
        'role',
        isEqualTo: role.toRoleString(),
      ),
      builder: (data, documentId) => AccountModel.fromJson(data),
    );
  }

  @override
  Future<List<ExaminationQuestionModel>> getExaminationQuestions({
    required String id,
    required String questionType,
  }) {

    return baseService.getListData<ExaminationQuestionModel>(
      path: '${FirestorePaths.examination(id)}/$questionType',
      builder: (data, documentId) => ExaminationQuestionModel.fromJson(data),
    );
  }
}
