import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:stoik_app/data/history_data/history_list.dart';
import 'package:flutter/widgets.dart';
import 'package:stoik_app/model/answer_model.dart';
import 'package:stoik_app/model/db_game_model.dart';
import 'package:stoik_app/model/history_model.dart';
import 'package:stoik_app/utils/db_helper/game_db.dart';

class GameProvider extends ChangeNotifier {
  GameProvider() {
    init();
  }

  final GameDb _gameDb = GameDb();

  int diceNumber = 1;

  int gameSet = 0;

  bool isGameFinished = false;

  bool isDicePair = true;

  int choices = 1;
  int choiceCounter = 0;
  bool showBonusAnswers = false;

  int scoresPositive = 0;
  int scoresNegative = 0;

  late Timer timer;

  List<Game> _gameList = [];

  init() async {
    getAllGames();
  }

  @override
  void dispose() {
    stopDice();
    super.dispose();
  }

  List<HistoryModel> _historyList = historyDataList;

  UnmodifiableListView<HistoryModel> get historyList {
    return UnmodifiableListView(_historyList);
  }

  int get historyListCounter {
    return _historyList.length;
  }

  void removeSelectedHistoryCard(int index) {
    _historyList = List.from(_historyList)..removeAt(index);

    notifyListeners();
  }

  void getAllHistories() {
    _historyList = historyDataList;
    notifyListeners();
  }

  //todo: try future:
  void shuffleDice(int shuffleTime) {
    // Future.delayed(Duration(seconds: shuffleTime), () {
    //   stopDice();
    //   // swapPages();
    // });
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      diceNumber = Random().nextInt(6) + 1;
      if (diceNumber % 2 == 1) {
        isDicePair = false;
        choices = 1;
      } else {
        isDicePair = true;
        choices = 2;
      }
      // notifyListeners();
    });

    notifyListeners();
  }

  void stopDice() {
    timer.cancel();

    notifyListeners();
  }

  void gameSetCounter(int set) {
    gameSet++;
    if (gameSet == set) {
      isGameFinished = true;
      addGameResult();
    } else {
      isGameFinished = false;
    }
    notifyListeners();
  }

  void scoreCounter(int pos, int neg) {
    scoresPositive += pos;
    scoresNegative += neg;
    resetChoiceCounter();
    notifyListeners();
  }

  void cardChoiceCounter() {
    choiceCounter++;
    if (choiceCounter == choices) {
      showBonusAnswers = true;
      if (scoresPositive > 0) {
        scoresPositive -= 1;
      }
    }
    notifyListeners();
  }

  void resetChoiceCounter() {
    choiceCounter = 0;
    showBonusAnswers = false;
    notifyListeners();
  }

  void resetGame() {
    getAllHistories();
    gameSet = 0;
    scoresPositive = 0;
    scoresNegative = 0;

    notifyListeners();
  }

  void setsCounter() {
    notifyListeners();
  }

  void addGameResult() async {
    double currentDate = DateTime.now().microsecondsSinceEpoch.toDouble();
    Game game = Game(
        scoresPositive: scoresPositive,
        scoresNegative: scoresNegative,
        date: currentDate);

    await _gameDb.insertGame(game).then((value) {
      //_gameDb.getAllGames();
      getLastScores();
      notifyListeners();
    });

    notifyListeners();
  }

  int allPositiveScores = 0;
  int allNegativeScores = 0;

  Future<List<Game>> getAllGames() async {
    resetGame();

    await _gameDb.getAllGames().then((games) {
      _gameList = games
          .where((item) =>
              (item.scoresPositive != null || item.scoresNegative != null))
          .toList();
      getAllScores(_gameList);
      notifyListeners();
      return _gameList;
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

  getLastScores() async {
    _gameList = await _gameDb.getAllGames();
    allPositiveScores += _gameList.last.scoresPositive!;
    allNegativeScores += _gameList.last.scoresNegative!;
    notifyListeners();
  }

  getAllScores(List<Game> games) {
    for (var game in games) {
      allPositiveScores += game.scoresPositive!;
      allNegativeScores += game.scoresNegative!;

      notifyListeners();
    }
    notifyListeners();
  }

  markSelectedCard(AnswerModel answer) {
    answer.isCardSelected();
    notifyListeners();
  }
}
