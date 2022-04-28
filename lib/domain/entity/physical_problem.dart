import 'package:covid_overcoming/values/res/strings.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kTablePhysicalProblem)
class PhysicalProblem {
  const PhysicalProblem({
    required this.id,
    required this.problem,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'problem')
  final String problem;
}
