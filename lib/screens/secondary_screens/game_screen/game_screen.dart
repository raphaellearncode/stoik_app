import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stoik_app/main.dart';
import 'package:stoik_app/model/soci_model.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/providers/game_provider/game_provider.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:stoik_app/widgets/cards/game_play_card.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';
import 'game_dice_page.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<SocialModel> _gameMenu = [
    SocialModel(title: "Zakończ", icon: FontAwesomeIcons.powerOff, link: ''),
    //SocialModel(title: "Przetasuj", icon: Icons.refresh, link: ''),
  ];
  var isBtnVisible = true;

  int get gameMenuCounter {
    return _gameMenu.length;
  }

  final CarouselController _carouselController = CarouselController();
  goToPrevious() {
    _carouselController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    _carouselController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sidePadding = 8.0;
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double cardHeight = sizeInfo.gameCardHeight;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double subTitleFontSize = sizeInfo.headerSubtitleSize;
    double ratio = sizeInfo.aspectRatioCard;
    double numSize = sizeInfo.cardNumberSize;
    double backMenuPageCardSize = sizeInfo.eduCardSize;
    double buttonCard = sizeInfo.buttonCardSize;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer2<GameProvider, SettingsProvider>(
          builder: (context, gameProvider, settingsProvider, child) {
            return PaddingWrap(
              key: widget.key,
              contentPage: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/play_game.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sidePadding),
                      child: Text(
                        'WYBIERZ KARTĘ',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: headerFontSize),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 1.5,
                            margin: const EdgeInsets.only(right: 5.0),
                            color: Theme.of(context).backgroundColor,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rozdanie: ${gameProvider.gameSet} / ${settingsProvider.cardSets}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: subTitleFontSize,
                                        height: 1.2),
                              ),
                              RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: 'Punkty satysfakcji: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: subTitleFontSize,
                                            height: 1.2),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' ${gameProvider.scoresPositive}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: subTitleFontSize,
                                                height: 1.2,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w700),
                                      )
                                    ]),
                              ),
                              RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: 'Punkty frustracji: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: subTitleFontSize,
                                            height: 1.2),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' ${gameProvider.scoresNegative}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: subTitleFontSize,
                                                height: 1.2,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700),
                                      )
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CarouselSlider.builder(
                          itemCount: gameProvider.historyListCounter,
                          carouselController: _carouselController,
                          options: CarouselOptions(
                              aspectRatio: ratio,
                              height: cardHeight,
                              initialPage: 0,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              reverse: false,
                              scrollPhysics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: 0.4,
                              pageSnapping: true,
                              onPageChanged: (index, function) {}),
                          itemBuilder: (context, index, hero) {
                            final history = gameProvider.historyList[index];
                            return PlayAnimation<double>(
                                tween: Tween<double>(begin: 0.5, end: 1.0),
                                duration: const Duration(milliseconds: 300),
                                delay: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                                builder: (context, child, value) {
                                  return Transform.scale(
                                    scale: value,
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.of(context).push(
                                            PageRouteBuilder(
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 700),
                                                reverseTransitionDuration:
                                                    const Duration(
                                                        milliseconds: 700),
                                                pageBuilder: (context,
                                                        animation,
                                                        scondaryAnimation) =>
                                                    GameDice(
                                                      history: history,
                                                      heroIndex: index,
                                                    ),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  return child;
                                                }));
                                        gameProvider
                                            .removeSelectedHistoryCard(index);
                                      },
                                      child: GamePlayCard(
                                        index: index,
                                        heroTag: 'HISTORY_CARD${index}',
                                        historyNumber: history.historyNumber,
                                        title: history.title,
                                        cardVerticalText: titleFontSize,
                                        description: history.historyDescription,
                                        cardNumberSize: numSize,
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sidePadding, vertical: 30),
                      child: RowBuilder(
                        mainAxisAlignment: gameProvider.gameSet > 0
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceEvenly,
                        itemCount: gameMenuCounter,
                        itemBuilder: (context, index) {
                          final menu = _gameMenu[index];

                          return SizedBox(
                            width: buttonCard,
                            height: buttonCard,
                            child: Visibility(
                              visible: (gameProvider.gameSet > 0 && index == 0)
                                  ? isBtnVisible = false
                                  : isBtnVisible = true,
                              child: EducationCard(
                                title: 'powrót do menu',
                                fontSize: subTitleFontSize,
                                assetPath: 'assets/images/home.png',
                                onTap: () async {
                                  if (index == 0) {
                                    await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const HomePage(
                                            title: 'StoLik',
                                          ),
                                        ),
                                        (route) => false);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
