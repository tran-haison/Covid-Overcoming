import 'package:covid_overcoming/data/datasource/local/db/app_database.dart';
import 'package:covid_overcoming/data/datasource/local/pref/app_pref.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDatasource {
  Future<List<Stage>> getAllStages();
}

@LazySingleton(as: LocalDatasource)
class LocalDatasourceImpl implements LocalDatasource {
  const LocalDatasourceImpl(
    this.appDatabase,
    this.appPref,
  );

  final AppDatabase appDatabase;
  final AppPref appPref;

  @override
  Future<List<Stage>> getAllStages() {
    return appDatabase.appDao.getAllStages();
  }
}
