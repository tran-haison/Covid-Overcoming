import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_paths.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/model/examination/examination_answer_model.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:covid_overcoming/data/model/knowledge/knowledge_model.dart';
import 'package:covid_overcoming/data/model/rule/rule_model.dart';
import 'package:covid_overcoming/data/model/rule/sub_rule_model.dart';
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

  Future<RuleModel> getRule(String id);
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
  }) async {
    // Get list of initial questions with no answers
    final questions = await baseService.getListData<ExaminationQuestionModel>(
      path: '${FirestorePaths.examination(id)}/$questionType',
      builder: (data, documentId) => ExaminationQuestionModel.fromJson(data),
    );

    // Convert list of initial questions to list of new questions with answers
    List<ExaminationQuestionModel> newQuestions = [];
    for (var question in questions) {
      final answers = await baseService.getListData<ExaminationAnswerModel>(
        path:
            '${FirestorePaths.examination(id)}/$questionType/${question.id}/answers',
        builder: (data, documentId) => ExaminationAnswerModel.fromJson(data),
        queryBuilder: (query) => query.orderBy('literal'),
      );
      final newQuestion = question.copyWith(answers: answers);
      newQuestions.add(newQuestion);
    }

    return newQuestions;
  }

  @override
  Future<RuleModel> getRule(String id) async {
    final knowledges = await baseService.getListData<KnowledgeModel>(
      path: FirestorePaths.ruleKnowledges(id),
      builder: (data, documentId) => KnowledgeModel.fromJson(data),
    );

    final subRules = await baseService.getListData<SubRuleModel>(
      path: FirestorePaths.ruleSubRules(id),
      builder: (data, documentId) => SubRuleModel.fromJson(data),
    );

    final json = await baseService.getData(path: FirestorePaths.rule(id));

    return RuleModel.fromJson(json).copyWith(
      knowledges: knowledges,
      subRules: subRules,
    );
  }
}
