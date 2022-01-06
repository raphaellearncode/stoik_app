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
    shadowColor: Colors.black38,
    textTheme: TextTheme(
      headline2: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              color: color_card_history_bcg, fontSize: 18, height: 1.5)),

      ///title card
      headline1: GoogleFonts.notoSans(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      )),

      /// card number
      headline3: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              color: color_card_history_bcg, fontSize: 23, letterSpacing: 2)),

      ///history title
      headline4: GoogleFonts.arimo(
          textStyle: const TextStyle(
              color: color_card_answear_bcg,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              letterSpacing: 2)),

      headline5: GoogleFonts.montserrat(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      )),

      /// sentence
      bodyText1: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic)),

      /// captions
      subtitle1: GoogleFonts.notoSans(
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
    ));
