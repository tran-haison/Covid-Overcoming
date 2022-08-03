import 'package:covid_overcoming/data/datasource/local/db/database_constants.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kTableRiskTest)
class RiskTest {
  const RiskTest({
    required this.id,
    required this.test,
    required this.riskId,
    required this.isPassed,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'test')
  final String test;

  @ColumnInfo(name: 'risk_id')
  final int riskId;

  @ColumnInfo(name: 'is_passed')
  final int isPassed;
}
