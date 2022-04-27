import 'package:floor/floor.dart';

@Entity(tableName: 'physical_problem')
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
