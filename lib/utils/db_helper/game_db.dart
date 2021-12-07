import 'package:sqflite/sqflite.dart';
import 'package:stoik_app/model/db_game_model.dart';

import 'db_helper.dart';

class GameDb {
  GameDb();

  final DatabaseHelper dbGame = DatabaseHelper.databaseHelper;

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await dbGame.database;
    var result = await db.rawQuery('''SELECT * FROM ${dbGame.gameTable}''');
    return result;
  }

  Future<int> insertTask(Game game) async {
    Database db = await dbGame.database;
    var result = await db.insert(dbGame.gameTable, game.toMap());
    return result;
  }

  Future<List<Game>> getAllGames() async {
    Database db = await dbGame.database;
    var result = await db.query(dbGame.gameTable);
    return result.map((e) => Game.fromMap(e)).toList();
  }

  Future<int> deleteAllGames() async {
    Database db = await dbGame.database;
    var result = await db.delete(dbGame.gameTable);
    return result;
  }
}
