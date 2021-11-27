import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:stoik_app/data/history_data/history_list.dart';
import 'package:flutter/widgets.dart';
import 'package:stoik_app/model/history_model.dart';

class GameProvider extends ChangeNotifier {
  GameProvider() {
    init();
  }
  int diceNumber = 1;

  int gameSet = 0;

  bool isGameFinished = false;

  bool isDicePair = true;

  int choices = 1;

  int scoresPositive = 0;
  int scoresNegative = 0;

  late Timer timer;

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
    } else {
      isGameFinished = false;
    }
    notifyListeners();
  }

  void scoreCounter(int pos, int neg) {
    scoresPositive += pos;
    scoresNegative += neg;
    notifyListeners();
  }

  void resetGame() {
    //todo first add game result to database => than reset scores
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
}
