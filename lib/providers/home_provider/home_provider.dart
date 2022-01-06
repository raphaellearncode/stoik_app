import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:stoik_app/model/learning_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    init();
  }

  static const playStoreId = 'org.r85.stoik_app.stoik_app';
  static const appStoreId = 'org.r85.stoikapp.stoikApp';

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 0,
    remindDays: 7,
    remindLaunches: 10,
    googlePlayIdentifier: playStoreId,
    appStoreIdentifier: appStoreId,
  );

  rateApp(BuildContext context) {
    rateMyApp.init().then((_) {
      rateMyApp.showRateDialog(context,
          title: 'dodasz opinię?',
          message:
              'Chcielibysmy zwyczjnie wiedzieć czy filozofia stoicyzmu\nfaktycznie miała jakiś pozytywny wpływ na twoje życie. \ndaj znac co o tym myślisz :)',
          rateButton: 'Chętnie się podzielę',
          laterButton: 'Może później',
          noButton: 'Nie dzieki',
          dialogStyle: DialogStyle(
              titleStyle: Theme.of(context).textTheme.headline1,
              messageStyle: Theme.of(context).textTheme.headline5));
      return true;
    });
    notifyListeners();
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
