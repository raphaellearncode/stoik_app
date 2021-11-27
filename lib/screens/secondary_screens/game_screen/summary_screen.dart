//todo end game screen with points resulet and sentence + survey reflection option

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/main.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/screens/secondary_screens/survey_screen/survey_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:stoik_app/widgets/cards/sentence_card.dart';
import 'package:stoik_app/widgets/cards/summary_card.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer3<GameProvider, HomeProvider, SettingsProvider>(
          builder:
              (context, gameProvider, homeProvider, settingsProvider, child) {
            final daySentence = homeProvider.sentence;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wyniki gry:',
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SentenceCard(
                  imgAssets: daySentence.assetPath,
                  description: daySentence.description,
                  author: daySentence.title,
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Text(daySentence.title, //todo: autor sentencji
                //         style: GoogleFonts.rubik(
                //             fontSize: 12,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w400,
                //             height: 1.6)),
                //   ],
                // ),
                SummaryCard(
                  title: 'Punkty satysfakcji:',
                  scores: gameProvider.scoresPositive,
                ),
                SummaryCard(
                  title: 'Punkty frustracji:',
                  scores: gameProvider.scoresNegative,
                  isPositive: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Podziel się wrażeniami:',
                  style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: EducationCard(
                        title: 'Ankieta',
                        assetPath: 'assets/images/survey.png',
                        onTap: () async {
                          gameProvider.resetGame();
                          await Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: SurveyPage(),
                                  direction: AxisDirection.up));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: EducationCard(
                        title: 'Główne menu',
                        assetPath: 'assets/images/home.png',
                        onTap: () async {
                          gameProvider.resetGame();
                          await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                  title: 'StoLik',
                                ),
                              ),
                              (route) => false);
                        },
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 12.0, left: 7.0),
                //   child: Column(
                //     children: [
                //       Text(
                //         'Wyniki gry:',
                //         style: GoogleFonts.rubik(
                //             fontSize: 20,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w500),
                //       ),
                //       Expanded(
                //         child: SentenceCard(
                //           imgAssets: daySentence.assetPath,
                //           description: daySentence.description,
                //           author: daySentence.title,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text(daySentence.title, //todo: autor sentencji
                //               style: GoogleFonts.rubik(
                //                   fontSize: 12,
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w400,
                //                   height: 1.6)),
                //         ],
                //       ),
                //       SummaryCard(
                //         title: 'Punkty satysfakcji:',
                //         scores: gameProvider.scoresPositive,
                //       ),
                //       SummaryCard(
                //         title: 'Punkty frustracji:',
                //         scores: gameProvider.scoresNegative,
                //         isPositive: false,
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Text(
                //         'Podziel się wrażeniami:',
                //         style: GoogleFonts.rubik(
                //             fontSize: 15,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w400),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           SizedBox(
                //             width: 120,
                //             height: 120,
                //             child: EducationCard(
                //               title: 'Ankieta',
                //               assetPath: 'assets/images/survey.png',
                //               onTap: () async {
                //                 await Navigator.push(
                //                     context,
                //                     CustomPageRoute(
                //                         child: SurveyPage(),
                //                         direction: AxisDirection.up));
                //               },
                //             ),
                //           ),
                //           SizedBox(
                //             width: 120,
                //             height: 120,
                //             child: EducationCard(
                //               title: 'Główne menu',
                //               assetPath: 'assets/images/home.png',
                //               onTap: () async {
                //                 await Navigator.pushAndRemoveUntil(
                //                     context,
                //                     MaterialPageRoute(
                //                       builder: (context) => MyHomePage(
                //                         title: 'StoLik',
                //                       ),
                //                     ),
                //                     (route) => false);
                //               },
                //             ),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
