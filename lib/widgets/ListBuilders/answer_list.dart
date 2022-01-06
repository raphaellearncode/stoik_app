import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stoik_app/model/answer_model.dart';
import 'package:stoik_app/model/history_model.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_screen.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/summary_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:stoik_app/widgets/cards/game_inner_card.dart';
import 'package:stoik_app/widgets/cards/game_play_card.dart';
import 'package:provider/provider.dart';

class AnswerList extends StatelessWidget {
  const AnswerList(
      {Key? key,
      required this.answers,
      required this.listCounter,
      required this.historyNumber,
      required this.toggleCard,
      required this.cardController,
      // required this.isVisible,
      this.cardType = 1})
      : super(key: key);

  final int historyNumber;
  final Function toggleCard;
  final List<AnswerModel> answers;
  final int listCounter;
  final int cardType;
  final FlipCardController cardController;
  // final bool isVisible;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double cardHeight = sizeInfo.gameCardHeight;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double subTitleFontSize = sizeInfo.headerSubtitleSize;
    double numSize = sizeInfo.cardNumberSize;
    double ratio = sizeInfo.aspectRatioCard;
    return Consumer3<GameProvider, SettingsProvider, StatsProvider>(
      builder: (context, gameProvider, settingsProvider, statsProvider, child) {
        return Visibility(
          visible: cardType == 3
              ? gameProvider.showBonusAnswers
              : !gameProvider.showBonusAnswers,
          child: SizedBox(
            height: cardHeight - 80,
            child: AnimationLimiter(
              child: GridView.count(
                padding: const EdgeInsets.all(5.0),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                crossAxisSpacing: 3.0,
                shrinkWrap: true,
                mainAxisSpacing: 3.0,
                crossAxisCount: 1,
                childAspectRatio: 1.7,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(child: widget),
                        ),
                    children: List.generate(listCounter, (index) {
                      final answerList = answers[index];
                      return GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              barrierColor: Colors.black54.withOpacity(0.5),
                              transitionDuration:
                                  const Duration(milliseconds: 700),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 700),
                              pageBuilder: (context, animation,
                                      scondaryAnimation) =>
                                  WillPopScope(
                                    onWillPop: () async => false,
                                    child: AlertDialog(
                                        title: Text(
                                          '${cardType == 3 ? 'Losowa karta' : 'Karta'} odpowiedzi',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        alignment: Alignment.center,
                                        actionsAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        elevation: 3,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        )),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 0),
                                        content:
                                            // child,
                                            SizedBox(
                                          width: cardHeight / 2,
                                          height: cardHeight + 40,
                                          child: FlipCard(
                                            direction: FlipDirection.HORIZONTAL,
                                            speed: 500,
                                            controller: cardController,
                                            onFlipDone: (status) {},
                                            front: GamePlayCard(
                                              index: historyNumber,
                                              heroTag:
                                                  'ANSWER_CARD${answerList.answerTag}',
                                              historyNumber: historyNumber,
                                              title: '',
                                              description: '',
                                              cardType: cardType,
                                              cardVerticalText: titleFontSize,
                                              cardNumberSize: numSize,
                                              isCardUsed: answerList.isSelected,
                                            ),
                                            back: GameInnerCard(
                                              title: ' ',
                                              cardType: cardType,
                                              historyNumber:
                                                  '${historyNumber} ${answerList.answerTag}',
                                              description:
                                                  answerList.answerDescription,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${gameProvider.choiceCounter == gameProvider.choices - 1 ? "Możesz zmienić kartę losową\nza (- 1 pkt.) satysfakcji." : " "}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      fontSize:
                                                          subTitleFontSize,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisAlignment: cardType == 3
                                                    ? MainAxisAlignment.center
                                                    : MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Visibility(
                                                    visible: cardType != 3
                                                        ? true
                                                        : false,
                                                    child: FlatBtn(
                                                      title: 'Zmień',
                                                      onPress: () {
                                                        gameProvider
                                                            .cardChoiceCounter();
                                                        gameProvider
                                                            .markSelectedCard(
                                                                answerList);

                                                        toggleCard;
                                                        Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        200))
                                                            .then((value) =>
                                                                Navigator.pop(
                                                                    context));
                                                      },
                                                    ),
                                                  ),
                                                  FlatBtn(
                                                    title: 'Odpowiedz',
                                                    onPress: () async {
                                                      gameProvider
                                                          .gameSetCounter(
                                                              settingsProvider
                                                                  .cardSets);
                                                      gameProvider.scoreCounter(
                                                          answerList
                                                              .scoresPositive,
                                                          answerList
                                                              .scoresNegative);

                                                      await Navigator.pushAndRemoveUntil(
                                                          context,
                                                          CustomPageRoute(
                                                              child: gameProvider
                                                                      .isGameFinished
                                                                  ? const SummaryPage()
                                                                  : const GameScreen(),
                                                              direction:
                                                                  AxisDirection
                                                                      .up),
                                                          (route) => false);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return child;
                              }));
                          Future.delayed(const Duration(seconds: 1))
                              .then((value) => toggleCard());
                        },
                        child: GamePlayCard(
                          shrink: true,
                          index: index,
                          isCardUsed: answerList.isSelected,
                          heroTag: 'ANSWER_CARD${answerList.answerTag}',
                          historyNumber: historyNumber,
                          title: '',
                          description: answerList.answerDescription,
                          cardType: cardType,
                          cardVerticalText: titleFontSize,
                          cardNumberSize: numSize,
                        ),
                      );
                    })),
              ),
            ),
          ),
        );
      },
    );
  }
}
