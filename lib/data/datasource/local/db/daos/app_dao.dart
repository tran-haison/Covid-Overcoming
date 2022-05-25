import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:floor/floor.dart';

@dao
abstract class AppDao {
  @Query('SELECT * FROM $kTableStage')
  Future<List<Stage>> getAllStages();
}
