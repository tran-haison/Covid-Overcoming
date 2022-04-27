import 'package:floor/floor.dart';

@Entity(tableName: 'borg_breathlessness_scale')
class BorgBreathlessnessScale {
  const BorgBreathlessnessScale({
    required this.id,
    required this.number,
    required this.breathlessness,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'number')
  final int number;

  @ColumnInfo(name: 'breathlessness')
  final String breathlessness;
}
