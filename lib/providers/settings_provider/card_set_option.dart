import 'dart:collection';

import 'package:stoik_app/model/settings_model.dart';

class CardSetOptions {
  final List<SettingsModel> _gameSetOptionsList = [
    SettingsModel(
      title: "Mam mało czasu:",
      description: "Szybka gra na 5 rozdań",
    ),
    SettingsModel(
      title: "Tak dla relaksu:",
      description: "Trening Stoika 10 rozdań w grze",
    ),
    SettingsModel(
      title: "Mam ochotę na coś więcej",
      description: "Stoik w akcji 15 rozdań w grze",
    ),
    SettingsModel(
      title: "Mam dużo czasu",
      description: "Mistrz w akcji 24 rozdań w grze",
    ),
  ];

  UnmodifiableListView<SettingsModel> get gameSetOptionsList {
    return UnmodifiableListView(_gameSetOptionsList);
  }

  int get gameSetOptionsListCounter {
    return _gameSetOptionsList.length;
  }
}
