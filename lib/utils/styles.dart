import 'package:flutter/material.dart';
import 'package:stoik_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: color_main_bcg,
    indicatorColor: color_indicators,
    primarySwatch: Colors.blue,
    backgroundColor: color_card_answear_bcg,
    canvasColor: color_card_history_bcg,
    focusColor: color_card_history_inner_bcg,
    unselectedWidgetColor: Colors.grey.shade600,
    primaryColor: Colors.green.shade400,
    primaryColorLight: Colors.red.shade400,
    primaryColorDark: color_card_random_bcg,
    // cardColor: kYellowColorVeryLight,
    // toggleableActiveColor: kYellowColorVeryLight,
    // indicatorColor: Colors.deepOrange,
    shadowColor: Colors.black38,
    // dialogBackgroundColor: kYellowColorDark,
    // primarySwatch: Colors.deepOrange,
    // splashColor: Colors.transparent,
    // dividerColor: kOperatorsFontColor,
    textTheme: TextTheme(
      headline2: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: color_card_history_bcg, fontSize: 18, height: 1.5)),

      ///title card
      headline1: GoogleFonts.rubik(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      )),

      /// card number
      headline3: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: color_card_history_bcg, fontSize: 23, letterSpacing: 2)),

      ///history title
      headline4: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: color_card_answear_bcg,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              letterSpacing: 2)),

      headline5: GoogleFonts.rubik(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w200,
      )),

      /// sentence
      bodyText1: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic)),

      /// captions
      subtitle1: GoogleFonts.rubik(
          textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w200,
              height: 2)),
    ),
    cardTheme: const CardTheme(
      shadowColor: Colors.black38,
      elevation: 3,
      color: color_card_history_bcg,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      )),
    )
    //
    //   /// list title
    //   headline2: GoogleFonts.exo(
    //     textStyle: const TextStyle(
    //         fontSize: 18,
    //         color: kYellowColorVeryLight,
    //         fontWeight: FontWeight.w500,
    //         decoration: TextDecoration.none),
    //   ),
    //
    //   /// date header style
    //   headline3: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //           fontSize: 18,
    //           color: kGreenColorVeryLight,
    //           fontWeight: FontWeight.w500,
    //           letterSpacing: 2)),
    //
    //   ///calendar weekend text style
    //   subtitle1: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //     fontSize: 18,
    //     color: Colors.deepOrange,
    //   )),
    //
    //   ///calendar marker style
    //   subtitle2: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //           fontSize: 10,
    //           color: Colors.white,
    //           fontWeight: FontWeight.bold,
    //           overflow: TextOverflow.ellipsis)),
    //
    //   ///task description text style
    //   bodyText1: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //           fontSize: 10,
    //           color: kOperatorsFontColor,
    //           fontWeight: FontWeight.w200,
    //           overflow: TextOverflow.ellipsis)),
    //
    //   ///note title style
    //   headline4: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //           fontSize: 18,
    //           color: kMainDarkBcgColor,
    //           fontWeight: FontWeight.w500,
    //           letterSpacing: 0,
    //           overflow: TextOverflow.ellipsis)),
    //
    //   ///note description text style
    //   bodyText2: GoogleFonts.exo(
    //       textStyle: const TextStyle(
    //           fontSize: 10,
    //           color: kMainTitleBoxColor,
    //           fontWeight: FontWeight.w200,
    //           overflow: TextOverflow.ellipsis)),
    // ),
    // textSelectionTheme: const TextSelectionThemeData(
    //   selectionHandleColor: Colors.transparent,
    // ),
    // dividerTheme: const DividerThemeData(
    //   color: colorDivider,
    //   thickness: 0.5,
    // ),
    // navigationRailTheme: NavigationRailThemeData(
    //   labelType: NavigationRailLabelType.all,
    //   groupAlignment: -0.5,
    //   selectedIconTheme: const IconThemeData(
    //     color: Colors.deepOrange,
    //   ),
    //   unselectedIconTheme: const IconThemeData(color: kEnabledIconColorDark),
    //   selectedLabelTextStyle: GoogleFonts.rubik(
    //     textStyle: const TextStyle(
    //         color: kYellowColorVeryLight,
    //         fontSize: 18,
    //         fontWeight: FontWeight.w900),
    //   ),
    //   unselectedLabelTextStyle: GoogleFonts.exo2(
    //     textStyle: const TextStyle(
    //         color: kEnabledIconColorDark,
    //         fontSize: 17,
    //         fontWeight: FontWeight.w900),
    //   ),
    // ),
    // accentIconTheme: const IconThemeData(color: kYellowColorVeryLight, size: 18),
    // iconTheme: const IconThemeData(
    //   color: kYellowColorVeryLight,
    //   size: 18,
    // ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //       elevation: MaterialStateProperty.all<double>(.0),
    //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    //       shadowColor: MaterialStateProperty.all<Color>(kMainBcgColor),
    //       splashFactory: NoSplash.splashFactory),
    // ),
    // switchTheme: SwitchThemeData(
    //     thumbColor: MaterialStateProperty.resolveWith(
    //       (states) {
    //         if (states.contains(MaterialState.selected)) {
    //           return Colors.deepOrange;
    //         } else {
    //           return Colors.white;
    //         }
    //       },
    //     ),
    //     trackColor: MaterialStateProperty.all(kMainBcgColor)),
    // floatingActionButtonTheme:
    //     const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    // dialogTheme: DialogTheme(
    //     elevation: 5.0,
    //     titleTextStyle: GoogleFonts.exo2(
    //       textStyle: const TextStyle(
    //           color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
    //     ),
    //     contentTextStyle: GoogleFonts.exo2(
    //       textStyle: const TextStyle(
    //           color: kEnabledIconColorDark,
    //           fontSize: 12,
    //           fontWeight: FontWeight.w200),
    //     ),
    //     backgroundColor: kMainTitleBoxColor,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    // inputDecorationTheme: const InputDecorationTheme(
    //   border: InputBorder.none,
    //   focusedBorder: InputBorder.none,
    //   enabledBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(width: .5, color: colorDivider)),
    //   errorBorder: InputBorder.none,
    //   disabledBorder: InputBorder.none,
    //   focusedErrorBorder: InputBorder.none,
    //   isDense: true,
    //   filled: false,
    //   hintStyle: TextStyle(color: kGreenColorMiddle, fontSize: 20),
    //   contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
    //   suffixStyle: TextStyle(
    //     color: colorDivider,
    //   ),
    //   labelStyle: TextStyle(
    //     color: colorDivider,
    //   ),
    //   alignLabelWithHint: true,
    //   prefixStyle: TextStyle(
    //     color: colorDivider,
    //   ),
    //   helperMaxLines: 1,
    //   helperStyle: TextStyle(
    //     color: colorDivider,
    //     fontSize: 8.0,
    //   ),
    // ),
    // bottomSheetTheme: const BottomSheetThemeData(
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.horizontal(
    //         left: (Radius.circular(15)), right: (Radius.circular(15))),
    //   ),
    // ),
    // tabBarTheme: TabBarTheme(
    //   indicator: const UnderlineTabIndicator(
    //       borderSide: BorderSide(width: 2.0, color: Colors.deepOrange),
    //       insets: EdgeInsets.symmetric(horizontal: 16.0)),
    //   labelColor: kYellowColorVeryLight,
    //   unselectedLabelColor: Colors.black54,
    //   unselectedLabelStyle: GoogleFonts.raleway(
    //     textStyle: const TextStyle(
    //         fontSize: 12,
    //         color: kEnabledIconColorDark,
    //         fontWeight: FontWeight.w200,
    //         decoration: TextDecoration.none),
    //   ),
    //   labelStyle: GoogleFonts.raleway(
    //     textStyle: const TextStyle(
    //         fontSize: 12,
    //         color: kYellowColorVeryLight,
    //         fontWeight: FontWeight.w500,
    //         decoration: TextDecoration.none),
    //   ),
    // ),
    // sliderTheme: const SliderThemeData(
    //     activeTrackColor: Colors.deepOrange,
    //     inactiveTrackColor: kEnabledIconColorDark,
    //     trackShape: RoundedRectSliderTrackShape(),
    //     thumbColor: Colors.white)
    );
