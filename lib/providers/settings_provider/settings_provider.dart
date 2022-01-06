import 'package:flutter/material.dart';
import 'package:stoik_app/utils/prefs/prefs.dart';

import 'card_set_option.dart';
import 'dice_options.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    init();
  }

  init() async {
    getDiceShuffleTime();
    getGameRounds();
  }

  final Prefs _prefs = Prefs();

  int diceShuffleDuration = 3;
  int setShuffleOption = 0;

  int cardSets = 5;
  int setGameSetOption = 1;
  late ThemeData themeData;

  getTheme() async {
    return themeData;
  }

  DiceShuffleOptions diceOptions = DiceShuffleOptions();

  void setDiceShuffleTime(int index) {
    setShuffleOption = index;
    _prefs
        .storeInt('diceShuffleKey', setShuffleOption)
        .then((value) => getDiceShuffleTime());

    notifyListeners();
  }

  void getDiceShuffleTime() async {
    setShuffleOption =
        await _prefs.restoreInt('diceShuffleKey', setShuffleOption);
    switch (setShuffleOption) {
      case 0:
        diceShuffleDuration = 3;
        break;
      case 1:
        diceShuffleDuration = 5;
        break;
      case 2:
        diceShuffleDuration = 7;
        break;
      case 3:
        diceShuffleDuration = 10;
        break;

      default:
        diceShuffleDuration = 3;
    }
    notifyListeners();
  }

  void cardsInStock() {
    notifyListeners();
  }

  CardSetOptions gameRounds = CardSetOptions();
  void setGameRounds(int index) {
    setGameSetOption = index;
    _prefs
        .storeInt('gamSetKey', setGameSetOption)
        .then((value) => getGameRounds());
    notifyListeners();
  }

  void isTestingGame(bool isTest) {
    if (isTest) {
      cardSets = 1;
    } else {
      getGameRounds();
    }
    notifyListeners();
  }

  void getGameRounds() async {
    setGameSetOption = await _prefs.restoreInt('gamSetKey', setGameSetOption);
    switch (setGameSetOption) {
      case 0:
        cardSets = 5;
        break;
      case 1:
        cardSets = 10;
        break;
      case 2:
        cardSets = 15;
        break;
      case 3:
        cardSets = 24;
        break;

      default:
        cardSets = 1;
    }
  }
}
