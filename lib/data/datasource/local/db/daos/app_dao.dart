import 'package:covid_overcoming/data/datasource/local/db/database_constants.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:floor/floor.dart';

@dao
abstract class AppDao {
  @Query('SELECT * FROM $kTableStage')
  Future<List<Stage>> getAllStages();
}
