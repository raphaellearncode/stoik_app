import 'package:flutter/widgets.dart';
import 'screen_type.dart';

class Dimens {
  final ScreenType? screenType;
  final Size? screenSize;

  Dimens({this.screenSize, this.screenType}) {
    initDimensions();
  }

  ///game page dimens
  double gameCardHeight = 310;
  double aspectRatioCard = 1.7;
  double cardVerticalText = 10;
  double cardNumberSize = 22;
  double diceSize = 80;

  ///home screen dimens
  double topSpacing = 30;

  ///about screen dimens
  double sociIconsDimen = 20;
  double logoCardSize = 220;
  EdgeInsets logoCardMargin =
      const EdgeInsets.symmetric(horizontal: 30, vertical: 15);
  double cardBorderRadius = 110;
  double betweenSpacing = 40;

  ///sets scren dimens
  int setsCardHeight = 60;

  ///stats screen dimen:
  double chartCardHeight = 220;
  EdgeInsets chartPaddingVertical =
      const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0);
  double coinSize = 30;
  double chartFontSize = 8.0;

  ///screenShrinker
  EdgeInsets sideSpacingOnly = const EdgeInsets.only(right: .0, left: .0);

  ///grid list dimens
  int gridColumnCount = 2;
  double axisSpacing = 5.0;
  double sidePadding = 5.0;

  ///sentence card dimens:
  EdgeInsets sentenceCardPadding =
      const EdgeInsets.only(right: 12.0, left: 7.0);

  ///side menu dimens
  double smallLogoDimen = 35.0;
  double smallLogoPadding = 16.0;

  double menuIconsSize = 18.0;

  ///padding / margins:
  double edgePadding = 8.0;
  double menuTopMargin = 8.0;

  ///corner radius
  double cornerRadius = 15.0;

  ///general - repeat in other widgets:
  double largeHeaderSize = 21;
  double headerTitleSize = 18;
  double headerSubtitleSize = 12;

  ///education Pages:
  double eduCardSize = 180;

  double buttonCardSize = 100;

  void initDimensions() {
    print('DIMENSIONS INITIALIZED ${screenType}');

    if (screenType == ScreenType.tablet) {
      tabletDimens();
    } else {
      mobileDimens();
    }
  }

  void mobileDimens() {
    ///home screen dimens
    topSpacing = 30;

    buttonCardSize = 100;

    ///general - repeat in other widgets:
    largeHeaderSize = 21;
    headerTitleSize = 18;
    headerSubtitleSize = 12;
    logoCardSize = 220;
    logoCardMargin = const EdgeInsets.symmetric(horizontal: 30, vertical: 15);
    cardBorderRadius = 110;

    ///screenShrinker
    sideSpacingOnly = const EdgeInsets.only(right: 5.0, left: 7.0);

    ///side menu dimens
    smallLogoDimen = 45.0;
    smallLogoPadding = 16.0;

    menuIconsSize = 18.0;

    ///grid list dimens
    gridColumnCount = 2;
    axisSpacing = 5.0;

    ///sentence card dimens:
    EdgeInsets sentenceCardPadding =
        const EdgeInsets.only(right: 12.0, left: 7.0);

    ///about screen dimens
    sociIconsDimen = 20;
    betweenSpacing = 40;

    ///sets scren dimens
    setsCardHeight = 70;

    ///stats screen dimen:
    chartCardHeight = 220;
    chartPaddingVertical =
        const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0);
    coinSize = 30;
    chartFontSize = 8.0;

    ///education Pages:
    eduCardSize = 140;

    ///game page dimens
    gameCardHeight = 320;
    aspectRatioCard = 1.7;
    cardNumberSize = 18;
    diceSize = 80;
  }

  void tabletDimens() {
    buttonCardSize = 120;

    ///home screen dimens
    topSpacing = 50;

    ///general - repeat in other widgets:
    largeHeaderSize = 25;
    headerTitleSize = 21;
    headerSubtitleSize = 16;

    ///screenShrinker
    sideSpacingOnly = const EdgeInsets.only(right: 26.0, left: 12.0);

    ///side menu dimens
    smallLogoDimen = 60.0;
    smallLogoPadding = 18.0;

    ///grid list dimens
    gridColumnCount = 3;
    axisSpacing = 5.0;

    menuIconsSize = 23.0;

    ///about screen dimens
    betweenSpacing = 60;
    sociIconsDimen = 30;
    logoCardSize = 320;
    logoCardMargin = const EdgeInsets.symmetric(horizontal: 50, vertical: 25);
    cardBorderRadius = 170;

    ///sets scren dimens
    setsCardHeight = 80;

    ///stats screen dimen:
    chartCardHeight = 320;
    chartPaddingVertical =
        const EdgeInsets.symmetric(vertical: 50, horizontal: 16.0);
    coinSize = 45;
    chartFontSize = 12.0;

    ///education Pages:
    eduCardSize = 180;

    ///game page dimens
    gameCardHeight = 480;
    aspectRatioCard = 1.3;
    cardNumberSize = 23;
    diceSize = 120;
  }
}
