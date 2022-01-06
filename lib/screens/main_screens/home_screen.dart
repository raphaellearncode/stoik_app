import 'package:flutter/material.dart';
import 'package:stoik_app/providers/game_provider/game_provider.dart';
import 'package:stoik_app/providers/home_provider/home_provider.dart';
import 'package:stoik_app/providers/settings_provider/settings_provider.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_rules_page.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_screen.dart';
import 'package:stoik_app/screens/secondary_screens/in_progress_screen/in_progress_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stoik_app/widgets/cards/sentence_card.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    int axisCount = sizeInfo.gridColumnCount;
    double crossSpacing = sizeInfo.axisSpacing;
    double gridListPadding = sizeInfo.sidePadding;

    double topSpacing = sizeInfo.topSpacing;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;

    return Consumer3<HomeProvider, GameProvider, SettingsProvider>(
      builder: (context, providerData, gameProvider, settingsProvider, child) {
        // final daySentence = providerData.sentence;

        return PaddingWrap(
          key: key,
          contentPage: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: topSpacing,
              ),
              const Expanded(flex: 1, child: SentenceCard()),
              Expanded(
                flex: 1,
                child: AnimationLimiter(
                  child: GridView.count(
                    padding: EdgeInsets.all(gridListPadding),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    //isGrid == true ? Axis.vertical : Axis.horizontal,
                    crossAxisSpacing: crossSpacing,
                    shrinkWrap: true,
                    mainAxisSpacing: crossSpacing,
                    crossAxisCount: axisCount,
                    childAspectRatio: 1,
                    children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => ScaleAnimation(
                              scale: 0.5,
                              child: FadeInAnimation(child: widget),
                            ),
                        children: List.generate(
                            providerData.gameTitleListCounter, (index) {
                          final list = providerData.gameTitleList[index];
                          return EducationCard(
                            title: list.title,
                            assetPath: list.assetPath,
                            fontSize: cardTitleFontSize,
                            onTap: () async {
                              switch (index) {
                                case 0:
                                  await Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: GameRulesScreen(),
                                          direction: AxisDirection.up));
                                  break;
                                case 1:
                                  gameProvider.resetGame();
                                  await Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: const GameScreen(),
                                          direction: AxisDirection.up));
                                  break;
                                case 2:
                                  await Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: const InProgress(),
                                          direction: AxisDirection.up));
                                  break;
                                case 3:
                                  settingsProvider.isTestingGame(true);
                                  gameProvider.resetGame();
                                  await Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: const GameScreen(),
                                          direction: AxisDirection.up));
                                  break;
                              }
                            },
                          );
                        })),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
