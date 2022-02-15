import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import './db.dart' as db;
class SnapShot {
  static Future<int> createSnapshot(
    String place,
    String imageName,
    String? address,
    String? description,
    double? latitude,
    double? longtitude,
  ) async {
    final database = await db.DB.db();

    final data = {
      'place': place,
      'imageName': imageName,
      'address': address,
      'description': description,
      'latitude': latitude,
      'longtitude': longtitude
    };

    final id = await database.insert('snapshots', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getSnapshots() async {
    final database = await db.DB.db();
    return database.query('snapshots', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSnapshot(int id) async {
    final database = await db.DB.db();

    return database.query('snapshots', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateSnapshot(
    int id,
    String? place,
    String? imageName,
    String? address,
    String? description,
    double? latitude,
    double? longtitude) async {
      final database = await db.DB.db();

      final data = {
        'place': place,
        'imageName': imageName,
        'address': address,
        'description': description,
        'latitude': latitude,
        'longtitude': longtitude,
        'createdAt': DateTime.now().toString()
      };

      final result = await database.update('snapshots', data, where: 'id = ?', whereArgs: [id]);
      return result;
  }

  static Future<void> deleteSnapshot(int id) async {
    final database = await db.DB.db();
    try {
      await database.delete('snapshots', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint('something went wrong when deleting an item: $err');
    }
  }
}
