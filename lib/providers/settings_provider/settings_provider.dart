import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    init();
  }

  init() async {
    print('LOAD SETTINGS PROVIDER');
  }

  int diceShuffleDuration = 2;

  int cardSets = 3;
  //TODO: mailchimp url

  //todo: theme data
  late ThemeData themeData;

  getTheme() async {
    return themeData;
  }

  //todo: settings dice shuffle seconds

  void diceShuffleTime() {
    notifyListeners();
  }

  //todo: settings for card stock
  void cardsInStock() {
    notifyListeners();
  }

  //todo how many game rounds
  void gameRounds() {}
}
