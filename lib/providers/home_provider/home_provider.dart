import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    init();
  }

  init() async {
    print('LOAd Education PROVIDER');
    sentence = await randomSentence();
  }

  late Timer timer;
  late LearnModel sentence = sentenceList[0];

  final List<LearnModel> gameTitleList = [
    LearnModel('Zasady gry', '''''', 'assets/images/rules.png'),
    LearnModel('Gra pojedyncza', '''''', 'assets/images/single.png'),
    LearnModel('Gra online', '''''', 'assets/images/online_game.png'),
    LearnModel('Gra testowa', '''''', 'assets/images/test_game.png'),
  ];

  int get gameTitleListCounter {
    return gameTitleList.length;
  }

  final List<LearnModel> sentenceList = [
    LearnModel(
        'Marek Aurliusz',
        '''``Wypadki zewnetrzne duszy nie dotykają, lecz stoją spokojnie poza nią, a wszelki niepokój jest jedynie skutkiem wewnętrznego sądu.`` ''',
        'assets/images/meditation.png'),
    LearnModel(
        'Seneka',
        '''``Tylko w porównaniu z innymi jest się nieszczęśliwym``''',
        'assets/images/edu1.png'),
    LearnModel(
        'Epiktet',
        '''``Kiedy jesteś sam, powinieneś nazwać ten stan spokojem i wolnością i myśleć o sobie, jakbyś był bogiem, a gdy jesteś wśród wielu, nie powinieneś nazywać tego stanu tłumem, trudem, podrażnieniem, lecz festynem i zgromadzeniem, i przez to zaakceptować go całkowicie.`` ''',
        'assets/images/online_game.png'),
  ];

  int get sentenceListCounter {
    return sentenceList.length;
  }

  Future<LearnModel> randomSentence() async {
    int randomSentenceIndex = 0;

    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      randomSentenceIndex = Random().nextInt(sentenceList.length);
      sentence = sentenceList[randomSentenceIndex];
      //todo remove prints
      // print('sntnc of a day is: ${sentence.description}');
      notifyListeners();
    });
    return sentence;
  }
}
