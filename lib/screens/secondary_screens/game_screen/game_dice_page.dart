import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/model/answer_model.dart';
import 'package:stoik_app/model/history_model.dart';
import 'dart:async';
import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:stoik_app/model/soci_model.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/summary_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/ListBuilders/answer_list.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:stoik_app/widgets/cards/game_play_card.dart';
import 'package:stoik_app/widgets/cards/game_inner_card.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:provider/provider.dart';

import 'game_screen.dart';

class GameDice extends StatefulWidget {
  const GameDice({Key? key, required this.history, required this.heroIndex})
      : super(key: key);

  final HistoryModel history;
  final int heroIndex;

  @override
  State<GameDice> createState() => _GameDiceState();
}

class _GameDiceState extends State<GameDice> with TickerProviderStateMixin {
  bool showAnswers = false;

  bool showDice = true;

  bool isFront = true;

  late FlipCardController _flipCardHistoryController;

  late FlipCardController _flipCardAnswerController;

  late AnimationController _animationController;
  // late AnimationController _animationListController;
  late Animation<double> fade;
  late Animation<Offset> moveDice;

  final List<AnswerModel> _answersList = [];

  final List<AnswerModel> _bonusAnswersList = [];

  int get _answerListCounter {
    return 3; //_answersList.length;
  }

  int get _bonusAnswerListCounter {
    return _bonusAnswersList.length - 3;
  }

  int cardTypeSetter = 2;
//todo:
  sortingList() {
    setState(() {
      //widget.history.answers.removeRange(3, 5);
      for (var item in widget.history.answers) {
        _answersList.add(item);
      }
      for (var item in widget.history.answers.reversed) {
        _bonusAnswersList.add(item);
      }
    });
  }

  replaceRandomCards() {
    setState(() {
      // widget.history.answers.removeRange(0, 3);
      // for (var item in widget.history.answers) {
      //   _answersList.add(item);
      //
      //   cardTypeSetter = 3;
      // }
    });
  }

  final List<SocialModel> _diceOption = [
    SocialModel(
        title: "Rzuć kostką", icon: FontAwesomeIcons.powerOff, link: ''),
    SocialModel(title: "Zatrzymaj", icon: Icons.refresh, link: ''),
  ];

  int get diceOptionCounter {
    return _diceOption.length;
  }

  void swapPages() {
    setState(() {
      showAnswers = true;

      showDice = false;
      _animationController.forward();
    });
  }

  @override
  void initState() {
    super.initState();
    sortingList();
    _flipCardHistoryController = FlipCardController();
    _flipCardAnswerController = FlipCardController();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Future.delayed(const Duration(seconds: 1))
        .then((value) => _flipCardHistoryController.toggleCard());

    moveDice = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, -6.0))
        .animate(_animationController);

    //  fade = Tween<double>(begin: 1, end: 0).animate(_animationListController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleFlipHistoryCard() {
    _flipCardHistoryController.hint(
      duration: const Duration(milliseconds: 500),
      total: const Duration(milliseconds: 500),
    );
    _flipCardHistoryController.toggleCard();
  }

  void toggleFlipAnswerCard() {
    _flipCardAnswerController.hint(
      duration: const Duration(milliseconds: 500),
      total: const Duration(milliseconds: 500),
    );
    _flipCardAnswerController.toggleCard();
  }

  /// front image card
  Widget _historyFlipCard(context) {
    return SizedBox(
      width: 250,
      height: 380,
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 500,
          controller: _flipCardHistoryController,
          onFlipDone: (status) {
            print(status);
          },
          front: GamePlayCard(
            index: widget.heroIndex,
            heroTag:
                'HISTORY_CARD${widget.heroIndex}', //'${cardType == 1 ? 'HISTORY_CARD$index' : 'ANSWEAR_CARD$index'}',
            historyNumber: widget.history.historyNumber,
            title: widget.history.title,
            description: widget.history.historyDescription,
          ),
          back: _backCard(context)),
    );
  }

  /// inner card
  Widget _backCard(BuildContext context) {
    return GameInnerCard(
      historyNumber: '${widget.history.historyNumber}',
      title: widget.history.title,
      description: widget.history.historyDescription,
    );
  }

  // /// build answer card front + back
  // Widget _answerFlipCard(
  //     BuildContext context, AnswerModel answer, int cardType) {
  //   return SizedBox(
  //     // width: 175,
  //     height: 420,
  //     child: FlipCard(
  //       direction: FlipDirection.HORIZONTAL,
  //       speed: 500,
  //       controller: _flipCardAnswerController,
  //       onFlipDone: (status) {
  //         print(status);
  //       },
  //       front: GamePlayCard(
  //         index: widget.history.historyNumber,
  //         heroTag: 'ANSWER_CARD${answer.answerTag}',
  //         historyNumber: widget.history.historyNumber,
  //         title: '',
  //         description: '',
  //         cardType: cardType,
  //       ),
  //       back: GameInnerCard(
  //         title: ' ',
  //         cardType: cardType,
  //         historyNumber: '${widget.history.historyNumber} ${answer.answerTag}',
  //         description: answer.answerDescription,
  //       ),
  //     ),
  //   );
  // }

  // /// pop out answer dialog
  // Widget _showDialog(
  //     BuildContext context, Widget child, List<Widget> actionChild) {
  //   return AlertDialog(
  //       title: Text(
  //         'Karta odpowiedzi',
  //         style: Theme.of(context).textTheme.headline1,
  //       ),
  //       alignment: Alignment.bottomCenter,
  //       actionsAlignment: MainAxisAlignment.spaceEvenly,
  //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //       elevation: 3,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //         Radius.circular(10),
  //       )),
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 0),
  //       content: child,
  //       actions: actionChild
  //
  //       // <Widget>[
  //       //   // FlatBtn(
  //       //   //   title: 'Dobierz karty',
  //       //   //   onPress: () {},
  //       //   // ),
  //       //
  //       //   Consumer2<GameProvider, SettingsProvider>(
  //       //     builder: (context, game, settings, child) {
  //       //       return Row(
  //       //         children: [
  //       //           FlatBtn(
  //       //             title: 'Zmień kartę',
  //       //             onPress: () {
  //       //               toggleFlipAnswerCard();
  //       //
  //       //               Future.delayed(const Duration(milliseconds: 300))
  //       //                   .then((value) => Navigator.pop(context));
  //       //               // .whenComplete(() => replaceRandomCards());
  //       //             },
  //       //           ),
  //       //           FlatBtn(
  //       //             title: 'Odpowiedz',
  //       //             onPress: () async {
  //       //               game.gameSetCounter(settings.cardSets);
  //       //               game.scoreCounter();
  //       //               await Navigator.push(
  //       //                   context,
  //       //                   CustomPageRoute(
  //       //                       child: game.isGameFinished
  //       //                           ? const SummaryPage()
  //       //                           : const GameScreen(),
  //       //                       direction: AxisDirection.up));
  //       //             },
  //       //           )
  //       //         ],
  //       //       );
  //       //     },
  //       //   ),
  //       // ],
  //       );
  // }

  Widget _answerList(BuildContext context) {
    return AnswerList(
      answers: _answersList,
      listCounter: _answerListCounter,
      historyNumber: widget.history.historyNumber,
      cardController: _flipCardAnswerController,
      toggleCard: () {
        _flipCardAnswerController.toggleCard();
      },
      cardType: 2,
    );
  }

  Widget _bonusList(BuildContext context) {
    return AnswerList(
      answers: _bonusAnswersList,
      listCounter: _bonusAnswerListCounter,
      historyNumber: widget.history.historyNumber,
      cardController: _flipCardAnswerController,
      toggleCard: () {
        _flipCardAnswerController.toggleCard();
      },
      cardType: 3,
    );
  }

//   SizedBox(
  //   height: 220,
  //   child: AnimationLimiter(
  //     child: GridView.count(
  //       padding: const EdgeInsets.all(5.0),
  //       physics: const BouncingScrollPhysics(
  //           parent: AlwaysScrollableScrollPhysics()),
  //       scrollDirection: Axis.horizontal,
  //       crossAxisSpacing: 3.0,
  //       shrinkWrap: true,
  //       mainAxisSpacing: 3.0,
  //       crossAxisCount: 1,
  //       childAspectRatio: 1.7,
  //       children: AnimationConfiguration.toStaggeredList(
  //           duration: const Duration(milliseconds: 375),
  //           childAnimationBuilder: (widget) => ScaleAnimation(
  //                 scale: 0.5,
  //                 child: FadeInAnimation(child: widget),
  //               ),
  //           children: List.generate(
  //               _bonusAnswerListCounter, //widget.history.answers.length,
  //               (index) {
  //             final answerList =
  //                 // widget
  //                 //     .history
  //                 //     .answers[index];
  //                 _bonusAnswersList[index];
  //             return GestureDetector(
  //               onTap: () async {
  //                 Navigator.of(context).push(PageRouteBuilder(
  //                     opaque: false,
  //                     barrierColor: Colors.black54.withOpacity(0.5),
  //                     transitionDuration: const Duration(milliseconds: 700),
  //                     reverseTransitionDuration:
  //                         const Duration(milliseconds: 700),
  //                     pageBuilder: (context, animation, scondaryAnimation) =>
  //                         _showDialog(
  //                             context,
  //                             _answerFlipCard(context, answerList, 3),
  //                             <Widget>[
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceEvenly,
  //                                 crossAxisAlignment:
  //                                     CrossAxisAlignment.center,
  //                                 children: [
  //                                   FlatBtn(
  //                                     title: 'Odpowiedz',
  //                                     onPress: () async {
  //                                       // gameProvider.gameSetCounter(settingsProvider.cardSets);
  //                                       // gameProvider.scoreCounter(answerList.scoresPositive, answerList.scoresNegative);
  //                                       // await Navigator.push(context, CustomPageRoute(child: gameProvider.isGameFinished ? const SummaryPage() : const GameScreen(), direction: AxisDirection.up));
  //                                     },
  //                                   )
  //                                 ],
  //                               ),
  //                             ]),
  //                     transitionsBuilder:
  //                         (context, animation, secondaryAnimation, child) {
  //                       return child;
  //                     }));
  //                 Future.delayed(const Duration(seconds: 1)).then(
  //                     (value) => _flipCardAnswerController.toggleCard());
  //               },
  //               child: GamePlayCard(
  //                 shrink: true,
  //                 index: index,
  //                 heroTag: 'ANSWER_CARD${answerList.answerTag}',
  //                 historyNumber: widget.history.historyNumber,
  //                 title: '',
  //                 description: answerList.answerDescription,
  //                 cardType: 3,
  //               ),
  //             );
  //           })),
  //     ),
  //   ),
  // );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Consumer2<GameProvider, SettingsProvider>(
            builder: (context, gameProvider, settingsProvider, child) {
              //final answers = gameProvider.historyList[widget.history.id].answers;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleFlipHistoryCard();
                        });
                      },
                      child: _historyFlipCard(context),
                    ),
                  ),

                  // SizedBox(
                  //   height: 30,
                  // ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                          visible: showAnswers,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8.0),
                                child: RichText(
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: 'Wybierz kartę \n',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '(masz ${gameProvider.choices} prub${gameProvider.choices == 1 ? 'ę' : 'y'} lub \n możesz dobrać 1 z 2 kart losowych za 1 pkt. satysfakcji)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: 12, height: 1.5))
                                      ]),
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  _bonusList(context),
                                  _answerList(context),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(alignment: Alignment.center, children: [
                          Visibility(
                            visible: showDice,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'RZUĆ KOSTKĄ',
                                  style: GoogleFonts.rubik(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          //todo turn off after click
                          IgnorePointer(
                            ignoring: showAnswers,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  //print('test click dice');
                                  gameProvider.shuffleDice();
                                  Future.delayed(
                                      Duration(
                                          seconds: settingsProvider
                                              .diceShuffleDuration), () {
                                    gameProvider.stopDice();
                                    swapPages();
                                  });
                                });
                              },
                              child: SlideTransition(
                                position: moveDice,
                                child: Image.asset(
                                  'assets/images/dice${gameProvider.diceNumber}.png',
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
