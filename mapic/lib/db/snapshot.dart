import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import './db.dart' as db;
class SnapShot {
  static Future<int> createSnapshot(
    String place,
    String? description,
    double? latitude,
    double? longtitude
  ) async {
    final database = await db.DB.db();

    final data = {
      'place': place,
      'description': description,
      'latitude': latitude,
      'longtitud': longtitude
    };

    final id = await database.insert('snapshots', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
}
