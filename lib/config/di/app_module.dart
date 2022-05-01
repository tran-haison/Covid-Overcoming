import 'package:covid_overcoming/data/datasource/local/db/app_database.dart';
import 'package:covid_overcoming/data/datasource/local/db/database_helper.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_module.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies() => $initGetIt(getIt);

@module
abstract class AppModule {
  @lazySingleton
  @preResolve
  Future<AppDatabase> get appDatabase async {
    await copyDbFromAsset();
    return $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  }
}
