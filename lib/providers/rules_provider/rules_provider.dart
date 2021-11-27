import 'package:flutter/material.dart';
import 'package:stoik_app/model/rules_model.dart';

class RulesProvider extends ChangeNotifier {
  RulesProvider() {
    init();
  }

  init() async {
    print('LOAD SETTINGS PROVIDER');
  }

  //todo: game assets:
  final List<RulesModel> gameAssets = [
    RulesModel('GRA ZAWIERA:',
        '''- 24 Karty Historii,\n- 72 Karty Odpowiedzi,\n- 48 Kart Losowych,\n- żetony Satysfakcji,\n- żetony Frustracji,\n- kostkę do gry,\n- pudełko\n- regulamin'''),
    RulesModel('ZALECENIA:',
        '''Przed rozpoczęciem gry rekomendowane jest zapoznanie się z Działem "Czym jest Stoicyzm?". Rekomendowana ilość graczy to 2 lub 4, choć można także grać samemu. Grę rozpoczyna osoba, która ostatnio bardzo się na coś zdenerwowała.'''),
  ];

  int get gameAssetsListCounter {
    return gameAssets.length;
  }

  //todo: list of rules model content

  final List<RulesModel> rulesList = [
    RulesModel(
      'Krok 1',
      '''1. Następnie rzuca Gracz rozpoczynający czyta na głos Kartę Historii kostką. Jeśli wypadnie "1" gracz z trzech dostępnych Kart Odpowiedzi wybiera losowo jedną. Jeśli wypadnie "2", gracz może losowo wybrać dwie karty.''',
    ),
    RulesModel('Krok 2',
        '''Zadaniem gracza jest wybranie odpowiedzi najbardziej nawiązującej do postawy stoickiej. Jeśli wybrał jedynie jedna kartę - nie ma możliwości wyboru. Jeśli zaś dwie - wybiera postawę zbliżoną do stoickiej lub stoicką.'''),
    RulesModel('Krok 3',
        '''Jeśli gracz nie jest zadowolony z odpowiedzi - może skorzystać z Kart Losowych. W zamian za punkt satysfakcji może wylosować jedną Kartę Losową. Karty Losowe mają wysokie punktowanie dodatnie lub ujemne, także zawsze wiążą się z ryzykiem.'''),
    RulesModel('Krok 4',
        '''Gracz sprawdza w Liście Punktów ile żetonów otrzymuje lub oddaje za wybraną odpowiedź. Przykładowo, jeśli wybrał odpowiedź o numerze 2B, sprawdza ilość punktów przypisanych do tej karty. Tutaj następuje koniec tury'''),
    RulesModel('Krok 5',
        '''Kolejne tury działają na tych samych zasadach. Gra kończy się w momencie opracowania wszystkich Kart Historii. Wygrywa osoba z największą ilością punktów satysfakcji... ale czy na pewno? : )'''),
  ];

  int get rulesListCounter {
    return rulesList.length;
  }
}
