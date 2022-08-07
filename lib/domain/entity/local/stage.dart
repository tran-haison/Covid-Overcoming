import 'package:covid_overcoming/data/datasource/local/db/database_constants.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kTableStage)
class Stage {
  const Stage({
    required this.id,
    required this.name,
    required this.activityLevel,
    required this.objectives,
    required this.percentMaximumHRPermitted,
    required this.exerciseDuration,
    required this.exerciseIntensityExample,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  @ColumnInfo(name: 'activity_level')
  final String activityLevel;

  @ColumnInfo(name: 'objectives')
  final String objectives;

  @ColumnInfo(name: 'percent_maximum_hr_permitted')
  final String percentMaximumHRPermitted;

  @ColumnInfo(name: 'exercise_duration')
  final String exerciseDuration;

  @ColumnInfo(name: 'exercise_intensity_example')
  final String exerciseIntensityExample;
}
