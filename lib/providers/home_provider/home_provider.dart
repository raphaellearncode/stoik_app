import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    init();
  }

  init() async {
    print('LOAd Education PROVIDER');
  }

  final List<LearnModel> gameTitleList = [
    LearnModel('Zasady gry', '''''', 'assets/images/rules.png'),
    LearnModel('Gra pojedyncza', '''''', 'assets/images/test_game.png'),
    LearnModel('Gra online', '''''', 'assets/images/online_game.png'),
    LearnModel('Gra testowa', '''''', 'assets/images/single.png'),
  ];

  int get gameTitleListCounter {
    return gameTitleList.length;
  }
}
