import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/utils/prefs/prefs.dart';

class OnBoardingProvider extends ChangeNotifier {
  final Prefs _prefs = Prefs();

  bool isIntro = false;

  void storeIntro(value) {
    _prefs.storeBool('intro', value);
    notifyListeners();
  }

  OnBoardingProvider() {
    init();
  }

  init() async {
    isIntro = await _prefs.restoreBool('intro', isIntro);
    notifyListeners();
  }

  final List<LearnModel> policyList = [
    LearnModel(
        'Dane osobowe',
        '''
Zbieramy informacje o przeglądarkach i urządzeniach, z których korzystasz, w celu poprawienia wydajnosci produktu.
Zbieramy wyłącznie dane osobowe wymagane do świadczenia naszych usług i przechowujemy je tylko w zakresie niezbędnym do świadczenia tych usług.
STOLIK gromadzi adresy e-mail od osób, które komunikują się z nami za pośrednictwem poczty e-mail, a także informacje przekazane w ramach dobrowolnych działań,
takich jak rejestracja na stronie lub udział w ankietach czy newsletter.
Używamy gromadzonych informacji do bezpośredniej interakcji z Tobą.''',
        ' '),
    LearnModel(
        'Dane osobowe',
        '''
Zbieramy informacje o przeglądarkach i urządzeniach, z których korzystasz, w celu poprawienia wydajnosci produktu.
Zbieramy wyłącznie dane osobowe wymagane do świadczenia naszych usług i przechowujemy je tylko w zakresie niezbędnym do świadczenia tych usług.
STOLIK gromadzi adresy e-mail od osób, które komunikują się z nami za pośrednictwem poczty e-mail, a także informacje przekazane w ramach dobrowolnych działań,
takich jak rejestracja na stronie lub udział w ankietach czy newsletter.
Używamy gromadzonych informacji do bezpośredniej interakcji z Tobą.''',
        ' '),
    LearnModel(
        'Dane osobowe',
        '''
Zbieramy informacje o przeglądarkach i urządzeniach, z których korzystasz, w celu poprawienia wydajnosci produktu.
Zbieramy wyłącznie dane osobowe wymagane do świadczenia naszych usług i przechowujemy je tylko w zakresie niezbędnym do świadczenia tych usług.
STOLIK gromadzi adresy e-mail od osób, które komunikują się z nami za pośrednictwem poczty e-mail, a także informacje przekazane w ramach dobrowolnych działań,
takich jak rejestracja na stronie lub udział w ankietach czy newsletter.
Używamy gromadzonych informacji do bezpośredniej interakcji z Tobą.''',
        ' '),
  ];

  int get policyListCounter {
    return policyList.length;
  }

  final List<LearnModel> menuLearnList = [
    LearnModel(
        'Ekran gry',
        '''Tutaj znajdziesz główny ekran gry, \nklikając w kafelek przejdziesz do okienka gry. \nZalecamy zapoznać się z zasadami gry zanim zaczniesz :) ''',
        ' '),
    LearnModel(
        'Ekran edukacji',
        '''Okienko edukacji, tutaj dowiesz się czegoś o filozofii stoicyzmu\n sławnych filozofach od których wszystko się zaczęło. ''',
        ' '),
    LearnModel(
        'Ekran statystyk',
        '''W tym okienku możesz podejrzeć wszystkie zdobyte punkty jak i statystyki wyników gry, diagram najlepiej to obrazuje.''',
        ' '),
    LearnModel(
        'O nas',
        '''Tutaj znajduj się link do polityki prywatności, naszj strony internetowej jaki i socialmediów. \nHej! możesz też udostępnić link do tej aplikacji znajomym :)''',
        ' '),
    LearnModel(
        'Ekran ustawień',
        '''Okienko ustawień. Sam zdcyduj ile czasu trwa rzut kostką czy ilość rozdań w grze. ''',
        ' '),
  ];

  int get menuLearnListCounter {
    return menuLearnList.length;
  }
}
