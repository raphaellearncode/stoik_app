import 'package:flutter/material.dart';
import 'package:stoik_app/model/rules_model.dart';

class RulesProvider extends ChangeNotifier {
  RulesProvider() {
    init();
  }

  init() async {
    print('LOAD SETTINGS PROVIDER');
  }

  final List<RulesModel> gameAssets = [
    RulesModel('GRA ZAWIERA:',
        '''- 24 Karty Historii,\n- 72 Karty Odpowiedzi,\n- 48 Kart Losowych,\n- żetony Satysfakcji,\n- żetony Frustracji,\n- kostkę do gry,\n - regulamin'''), //pudełko\n
    RulesModel('ZALECENIA:',
        '''Przed rozpoczęciem gry rekomendowane jest zapoznanie się z Działem "Czym jest Stoicyzm?". Rekomendowana ilość graczy to 2 lub 4, choć można także grać samemu. Grę rozpoczyna osoba, która ostatnio bardzo się na coś zdenerwowała.'''),
    RulesModel('PUNKTACJA:',
        '''Można zdobyć w kartach odpowiedzi: 3 żetony satysfakcji LUB 3 żetony frustracji LUB 1 żeton frustracji i 1 satysfakcji\n
W kartach losowych: 5 żetonów satysfakcji LUB 5 żetonów frustracji'''),
  ];

  int get gameAssetsListCounter {
    return gameAssets.length;
  }

  final List<RulesModel> rulesList = [
    RulesModel(
      'Krok 1',
      '''Gracz rozpoczynający czyta na głos Kartę Historii 1 Następnie rzuca kostką. Jeśli wypadnie "1" gracz z trzech dostępnych Kart Odpowiedzi wybiera losowo jedną. Jeśli wypadnie "2", gracz może losowo wybrać dwie Karty Odpowiedzi.''',
    ),
    RulesModel('Krok 2',
        '''Zadaniem gracza jest wybranie odpowiedzi najbardziej nawiązującej do postawy stoickiej. Jeśli wybrał jedynie jedna kartę - nie ma możliwości wyboru. Jeśli zaś dwie - wybiera postawę zbliżoną do stoickiej lub stoicką.'''),
    RulesModel('Krok 3',
        '''Jeśli gracz nie jest zadowolony z odpowiedzi - może skorzystać z Kart Losowych. W zamian za punkt satysfakcji może wylosować jedną Kartę Losową. Karty Losowe mają wysokie punktowanie dodatnie lub ujemne, także zawsze wiążą się z ryzykiem. Kiedy gracz zdecyduje się na zakupienie Karty Losowej - nie może już wrócić do wyboru Karty Odpowiedzi.'''),
    RulesModel('Krok 4',
        '''Gracz sprawdza w Liście Punktów ile żetonów otrzymuje lub oddaje za wybraną odpowiedź. Przykładowo, jeśli wybrał odpowiedź o numerze 2B, sprawdza ilość punktów przypisanych do tej karty. Tutaj następuje koniec tury'''),
    RulesModel('Krok 5',
        '''Kolejne tury działają na tych samych zasadach. Gra kończy się w momencie opracowania wszystkich Kart Historii. Wygrywa osoba z największą ilością punktów satysfakcji... ale czy na pewno? : )'''),
  ];

  int get rulesListCounter {
    return rulesList.length;
  }

  final List<RulesModel> roundExampleList = [
    RulesModel(
      'Krok 1:\nOdczytanie Karty Historii i losowanie Kart Odopwiedzi',
      '''Gracz rozpoczynający czyta na głos Kartę Historii.\nNastępnie rzuca kostką.\n Jeśli wypadnie „ 1 ” — gracz losowo wybiera jedną Kartę Odpowiedzi.\n Jeśli wypadnie „ 2 ” — gracz losowo wybiera dwie Karty Odpowiedzi.''',
    ),
    RulesModel(
      'Krok 2:\nWybór Karty Odpowiedzi',
      '''Jeśli gracz wybrał jedną Kartę Odpowiedzi \n— nie ma w tym momencie możliwości wyboru.\nJeśli zaś dwie — wybiera postawę bardziej stoicką.''',
    ),
    RulesModel(
      'Krok 3:\nKarty Losowe',
      '''Jeśli gracz nie jest zadowolony z Kart Odpowiedzi jakie uzyskał, \nw zamian za punkt satysfakcji może wylosować jedną z Kart Losowych.\nKiedy zdecyduje się na zakupienie karty, nie może już wrócić do wyboru Kart Odpowiedzi.''',
    ),
    RulesModel(
      'Krok 4:\nŻetony Satysfakcji / Frustracji',
      '''Gracz sprawdza w Liście Punktów ile Żetonów Ssatysfakcji lub Frustracji otrzymuje za wybraną odpowiedź.''',
    ),
    RulesModel(
      'Koniec gry',
      '''Gra kończy się w momencie wyczerpania Karty Historii.
Każdy z graczy odejmuje liczbę swoich Żetonów Frustracji od Żetonów Ssatysfakcji.
Wygrywa osoba z największą ilością Żetonów Satysfakcji... ale czy na pewno? :)''',
    ),
  ];

  int get roundExampleListCounter {
    return roundExampleList.length;
  }
}
