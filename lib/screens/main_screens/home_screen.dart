import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/game_provider/game_provider.dart';
import 'package:stoik_app/providers/home_provider/home_provider.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_rules_page.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_screen.dart';
import 'package:stoik_app/screens/secondary_screens/in_progress_screen/in_progress_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stoik_app/widgets/cards/sentence_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, GameProvider>(
      builder: (context, providerData, gameProvider, child) {
        // final daySentence = providerData.sentence;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(flex: 1, child: SentenceCard()),
            // SizedBox(
            //   height: 20,
            // ),
            Expanded(
              flex: 1,
              child: AnimationLimiter(
                child: GridView.count(
                  padding: const EdgeInsets.all(5.0),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  //isGrid == true ? Axis.vertical : Axis.horizontal,
                  crossAxisSpacing: 5.0,
                  shrinkWrap: true,
                  mainAxisSpacing: 5.0,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => ScaleAnimation(
                            scale: 0.5,
                            child: FadeInAnimation(child: widget),
                          ),
                      children: List.generate(providerData.gameTitleListCounter,
                          (index) {
                        final list = providerData.gameTitleList[index];
                        return EducationCard(
                          title: list.title,
                          assetPath: list.assetPath,
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
                                        child: GameScreen(),
                                        direction: AxisDirection.up));
                                break;
                              case 2:
                                await Navigator.push(
                                    context,
                                    CustomPageRoute(
                                        child: InProgress(),
                                        direction: AxisDirection.up));
                                break;
                              case 3:
                                await Navigator.push(
                                    context,
                                    CustomPageRoute(
                                        child: GameScreen(),
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
        );
      },
    );
  }
}
