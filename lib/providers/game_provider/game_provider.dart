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

  final List<Game> _gameList = [];

  init() async {}

  @override
  void dispose() {
    stopDice();
    super.dispose();
  }

  final List<HistoryModel> _historyList = historyDataList;

  UnmodifiableListView<HistoryModel> get historyList {
    return UnmodifiableListView(_historyList);
  }

  int get historyListCounter {
    return _historyList.length;
  }

  void shuffleDice() {
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      diceNumber = Random().nextInt(6) + 1;
      if (diceNumber % 2 == 1) {
        isDicePair = false;
        choices = 1;
      } else {
        isDicePair = true;
        choices = 2;
      }
      //todo : remove prints
      print('RESZTA z Kostki $isDicePair');
      notifyListeners();
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
      // resetGame();
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
      //todo take of one score
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
    //todo first add game result to database => than reset scores
    print('RSET GAME: SCORE POS: $scoresPositive SCORE NEG: $scoresNegative');
    gameSet = 0;
    scoresPositive = 0;
    scoresNegative = 0;

    notifyListeners();
  }

  //todo: refresh history list (shuffle)
  void refreshCardStock() {
    notifyListeners();
  }

  void setsCounter() {
    notifyListeners();
  }

  void addGameResult() async {
    Game game = Game(
        // id: game.id,
        scoresPositive: scoresPositive,
        scoresNegative: scoresNegative,
        date: DateTime.now());
    await _gameDb.insertTask(game).then((value) {
      _gameDb.getAllGames().then((value) {
        notifyListeners();
      });
    });
    int id = 1;
    if (game.id != null) {
      game.id = id++;
    } else {
      game.id = id;
    }
    print('RSULT INSERTD TO DB: ${game.id}');
    notifyListeners();
  }
}
