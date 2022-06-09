import 'package:covid_overcoming/data/utils/data_constants.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kTableBorgBreathlessnessScale)
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
