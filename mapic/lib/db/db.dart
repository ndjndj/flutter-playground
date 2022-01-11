import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DB {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      '''CREATE TABLE snapshots(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        place TEXT,
        description TEXT,
        latitude REAL,
        longtitude REAL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      '''
    );
  }
}
