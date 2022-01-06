import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/main.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:stoik_app/widgets/cards/sentence_card.dart';
import 'package:stoik_app/widgets/cards/summary_card.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;
    double coinSize = sizeInfo.coinSize;
    double backMenuPageCardSize = sizeInfo.eduCardSize;
    double buttonCard = sizeInfo.buttonCardSize;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer4<GameProvider, HomeProvider, SettingsProvider,
            StatsProvider>(
          builder: (context, gameProvider, homeProvider, settingsProvider,
              statsProvider, child) {
            return PaddingWrap(
              contentPage: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: coinSize,
                  ),
                  const SentenceCard(),
                  SizedBox(
                    height: coinSize,
                  ),
                  Text('Wyniki gry:',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: headerFontSize)),
                  SizedBox(
                    height: coinSize,
                  ),
                  SummaryCard(
                    title: 'Punkty satysfakcji:',
                    scores: gameProvider.scoresPositive,
                    coinSize: coinSize,
                    fontSize: cardTitleFontSize,
                  ),
                  SummaryCard(
                    title: 'Punkty frustracji:',
                    scores: gameProvider.scoresNegative,
                    isPositive: false,
                    coinSize: coinSize,
                    fontSize: cardTitleFontSize,
                  ),
                  Expanded(
                    child: Text('Podziel się wrażeniami:',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: titleFontSize)),
                  ),
                  // SizedBox(
                  //   height: coinSize,
                  // ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Consumer4<GameProvider, HomeProvider, SettingsProvider,
                StatsProvider>(
              builder: (context, gameProvider, homeProvider, settingsProvider,
                  statsProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: buttonCard,
                          height: buttonCard,
                          child: EducationCard(
                            title: 'Podziel się wrażeniami',
                            assetPath: 'assets/images/newsletter.png',
                            onTap: () async {
                              gameProvider.resetGame();
                              homeProvider.rateApp(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: coinSize,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: buttonCard,
                          height: buttonCard,
                          child: EducationCard(
                            title: 'Główne menu',
                            assetPath: 'assets/images/home.png',
                            onTap: () async {
                              settingsProvider.getGameRounds();
                              await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(
                                      title: 'StoLik',
                                    ),
                                  ),
                                  (route) => false);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
