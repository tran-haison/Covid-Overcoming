import 'dart:async';

import 'package:covid_overcoming/data/datasource/local/db/daos/app_dao.dart';
import 'package:covid_overcoming/domain/entity/borg_breathlessness_scale.dart';
import 'package:covid_overcoming/domain/entity/mental_problem.dart';
import 'package:covid_overcoming/domain/entity/physical_problem.dart';
import 'package:covid_overcoming/domain/entity/risk.dart';
import 'package:covid_overcoming/domain/entity/risk_test.dart';
import 'package:covid_overcoming/domain/entity/stage.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    Stage,
    Risk,
    RiskTest,
    PhysicalProblem,
    MentalProblem,
    BorgBreathlessnessScale,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  AppDao get appDao;
}
