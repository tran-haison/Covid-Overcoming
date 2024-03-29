import 'package:covid_overcoming/data/datasource/local/db/database_constants.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kTableRisk)
class Risk {
  const Risk({
    required this.id,
    required this.name,
    required this.description,
  });

  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  @ColumnInfo(name: 'description')
  final String description;
}
