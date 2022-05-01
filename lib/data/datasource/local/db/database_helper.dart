import 'dart:io';

import 'package:covid_overcoming/config/logger/logger.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> copyDbFromAsset() async {
  // Get db path
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, kDatabaseName);

  // Create db if not exist
  var exists = await databaseExists(path);
  if (!exists) {
    logger.d('Copy database from assets');

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      logger.e(e);
    }

    // Copy from asset
    ByteData data = await rootBundle.load(join(
      AssetPaths.assets,
      AssetPaths.database,
    ));
    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    logger.d('Open existing database');
  }
}
