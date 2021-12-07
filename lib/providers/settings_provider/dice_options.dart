import 'dart:collection';

import 'package:stoik_app/model/settings_model.dart';

class DiceShuffleOptions {
  final List<SettingsModel> _diceOptionsList = [
    SettingsModel(
      title: "Rzut kostką 3 sekundy",
      description: "Po rzuceniu kostką losowanie trwa 3 sekundy",
    ),
    SettingsModel(
      title: "Rzut kostką 5 sekund",
      description: "Po rzuceniu kostką losowanie trwa 5 sekund",
    ),
    SettingsModel(
      title: "Rzut kostką 7 sekund",
      description: "Po rzuceniu kostką losowanie trwa 7 sekund",
    ),
    SettingsModel(
      title: "Rzut kostką 10 sekund",
      description: "Po rzuceniu kostką losowanie trwa 10 sekund",
    ),
  ];

  UnmodifiableListView<SettingsModel> get diceOptionsList {
    return UnmodifiableListView(_diceOptionsList);
  }

  int get diceOptionsListCounter {
    return _diceOptionsList.length;
  }
}
