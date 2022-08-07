import 'dart:async';

import 'package:covid_overcoming/data/datasource/local/db/daos/app_dao.dart';
import 'package:covid_overcoming/domain/entity/local/borg_breathlessness_scale.dart';
import 'package:covid_overcoming/domain/entity/local/mental_problem.dart';
import 'package:covid_overcoming/domain/entity/local/physical_problem.dart';
import 'package:covid_overcoming/domain/entity/local/risk.dart';
import 'package:covid_overcoming/domain/entity/local/risk_test.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
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
