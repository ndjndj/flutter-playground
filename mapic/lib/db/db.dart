import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DB {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      '''CREATE TABLE snapshots(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        address TEXT,
        place TEXT,
        imagename TEXT,
        description TEXT,
        latitude REAL,
        longtitude REAL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      '''
    );
  }


  static Future<sql.Database> db() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'mapic.db');

    //DB削除
    await sql.deleteDatabase(path);

    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      }
    );
  }
}
