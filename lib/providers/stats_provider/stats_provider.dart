import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:stoik_app/model/db_game_model.dart';
import 'package:stoik_app/utils/db_helper/game_db.dart';

class StatsProvider extends ChangeNotifier {
  StatsProvider() {
    init();
  }

  init() async {
    await getAllPoints();
  }

  int allPositiveScores = 0;
  int allNegativeScores = 0;

  List<Game> _gameList = [
    // Game(id: 1, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 2, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 3, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 4, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 5, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 6, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 1, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 2, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 3, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 4, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 5, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 6, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 1, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 2, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 3, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 4, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 5, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 6, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 1, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 2, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 3, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
    // Game(id: 4, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
    // Game(id: 5, scoresNegative: 23, scoresPositive: 10, date: DateTime.now()),
    // Game(id: 6, scoresNegative: 31, scoresPositive: 12, date: DateTime.now()),
  ];
  final GameDb _gameDb = GameDb();

  Future<List<Game>> getAllPoints() async {
    _gameList = await _gameDb.getAllGames().then((games) {
      for (var game in games) {
        // if (game.id != null) {
        //
        // }
        allPositiveScores += game.scoresPositive!;
        allNegativeScores += game.scoresNegative!;
        notifyListeners();
      }

      return games;
    });

    notifyListeners();
    return _gameList;
  }

  UnmodifiableListView<Game> get gameList {
    return UnmodifiableListView(_gameList);
  }

  int get gameListCounter {
    return _gameList.length;
  }

  // BarChartGroupData(x: 1, barRods: [
  // BarChartRodData(
  // y: 14,
  // colors: [Colors.green, Colors.greenAccent],
  // width: barWidth,
  // borderRadius: BorderRadius.circular(5)),
  // BarChartRodData(
  // y: 10,
  // colors: [Colors.red, Colors.redAccent],
  // width: barWidth,
  // borderRadius: BorderRadius.circular(5)),
  // ]),
}
