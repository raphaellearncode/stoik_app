import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper databaseHelper = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = dbPath + 'note_database.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    //todo remove prints
    print('DATABASE IS INITIALIZED');
    return notesDatabase;
  }

  String gameTable = 'game_table';
  String gameId = 'game_id';
  String scoresPositive = 'scores_positive';
  String scoresNegative = 'scores_negative';
  String gameDate = 'game_date';

  void _createDb(Database db, int newVersion) async {
    Batch batch = db.batch();
    batch.execute('''CREATE TABLE $gameTable(
    $gameId INTEGER PRIMARY KEY AUTOINCREMENT,
    $scoresPositive STRING NOT NULL,
    $scoresNegative STRING NOT NULL, 
    $gameDate STRING)''');

    batch.commit();
  }
}
