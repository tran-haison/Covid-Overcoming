import 'package:floor/floor.dart';

@Entity(tableName: 'mental_problem')
class MentalProblem {
  const MentalProblem({
    required this.id,
    required this.problem,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'problem')
  final String problem;
}
