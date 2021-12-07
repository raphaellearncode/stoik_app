import 'package:stoik_app/model/db_game_model.dart';

List<Game> fakeChartData = [
  Game(id: 1, scoresNegative: 12, scoresPositive: 16, date: DateTime.now()),
  Game(
      id: 2,
      scoresNegative: 12,
      scoresPositive: 26,
      date: DateTime(
          DateTime.now().day + 1, DateTime.now().month, DateTime.now().year)),
  Game(
      id: 2,
      scoresNegative: 12,
      scoresPositive: 10,
      date: DateTime(
          DateTime.now().day + 2, DateTime.now().month, DateTime.now().year)),
  Game(
      id: 2,
      scoresNegative: 12,
      scoresPositive: 32,
      date: DateTime(
          DateTime.now().day + 3, DateTime.now().month, DateTime.now().year)),
  Game(
      id: 2,
      scoresNegative: 12,
      scoresPositive: 5,
      date: DateTime(
          DateTime.now().day + 4, DateTime.now().month, DateTime.now().year)),
  Game(
      id: 2,
      scoresNegative: 12,
      scoresPositive: 27,
      date: DateTime(
          DateTime.now().day + 5, DateTime.now().month, DateTime.now().year)),
];
