import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/model/answer_model.dart';
import 'package:stoik_app/model/history_model.dart';
import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:stoik_app/model/soci_model.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/ListBuilders/answer_list.dart';
import 'package:stoik_app/widgets/cards/game_play_card.dart';
import 'package:stoik_app/widgets/cards/game_inner_card.dart';
import 'package:provider/provider.dart';

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
  late Animation<double> fade;
  late Animation<Offset> moveDice;

  final List<AnswerModel> _answersList = [];

  final List<AnswerModel> _bonusAnswersList = [];

  int get _answerListCounter {
    return 3;
  }

  int get _bonusAnswerListCounter {
    return _bonusAnswersList.length - 3;
  }

  int cardTypeSetter = 2;

  sortingList() {
    setState(() {
      for (var item in widget.history.answers) {
        _answersList.add(item);
      }
      for (var item in widget.history.answers.reversed) {
        _bonusAnswersList.add(item);
      }
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

    moveDice = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, -2.0))
        .animate(_animationController);
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
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double cardHeight = sizeInfo.gameCardHeight;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double numSize = sizeInfo.cardNumberSize;
    double topSpacing = sizeInfo.topSpacing;

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
            heroTag: 'HISTORY_CARD${widget.heroIndex}',
            historyNumber: widget.history.historyNumber,
            title: widget.history.title,
            description: widget.history.historyDescription,
            cardNumberSize: numSize,
            cardVerticalText: titleFontSize,
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

  Widget _answerList(BuildContext context) {
    return AnswerList(
      answers: _answersList,
      listCounter: _answerListCounter,
      historyNumber: widget.history.historyNumber,
      cardController: _flipCardAnswerController,
      // isVisible: true,
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
      // isVisible: true,
      toggleCard: () {
        _flipCardAnswerController.toggleCard();
      },
      cardType: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double titleFontSize = sizeInfo.headerTitleSize;
    double subTitleFontSize = sizeInfo.headerSubtitleSize;
    double topSpacing = sizeInfo.topSpacing;
    double diceSize = sizeInfo.diceSize;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Consumer2<GameProvider, SettingsProvider>(
            builder: (context, gameProvider, settingsProvider, child) {
              //final answers = gameProvider.historyList[widget.history.id].answers;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: topSpacing,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        toggleFlipHistoryCard();
                      });
                    },
                    child: _historyFlipCard(context),
                  ),
                  Expanded(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: titleFontSize),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '(masz ${gameProvider.choices} prób${gameProvider.choices == 1 ? 'ę' : 'y'} lub \n możesz dobrać 1 z 2 kart losowych za 1 pkt. satysfakcji)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: subTitleFontSize,
                                                    height: 1.5))
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
                          IgnorePointer(
                            ignoring: showAnswers,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gameProvider.shuffleDice(
                                      settingsProvider.diceShuffleDuration);
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/dice${gameProvider.diceNumber}.png',
                                      width: diceSize,
                                      height: diceSize,
                                    ),
                                    Visibility(
                                      visible: !showAnswers,
                                      child: Text(
                                        'puknij w kostkę',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: subTitleFontSize),
                                      ),
                                    )
                                  ],
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
