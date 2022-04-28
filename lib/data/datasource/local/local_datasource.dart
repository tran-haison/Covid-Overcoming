import 'package:covid_overcoming/data/datasource/local/db/app_database.dart';
import 'package:covid_overcoming/domain/entity/stage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDatasource {
  Future<List<Stage>> getAllStages();
}

@LazySingleton(as: LocalDatasource)
class LocalDatasourceImpl implements LocalDatasource {
  const LocalDatasourceImpl(
    this.appDatabase,
  );

  final AppDatabase appDatabase;

  @override
  Future<List<Stage>> getAllStages() {
    return appDatabase.appDao.getAllStages();
  }
}
