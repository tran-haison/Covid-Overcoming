import 'package:covid_overcoming/data/utils/data_constants.dart';
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
