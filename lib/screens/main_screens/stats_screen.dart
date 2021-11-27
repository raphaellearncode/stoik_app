import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/widgets/cards/summary_card.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontColor = Colors.black;
    return Container(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Text(
              'Statystyki ',
              style: GoogleFonts.rubik(
                  fontSize: 30, color: fontColor, fontWeight: FontWeight.w400),
            ),
          ),
          Image.asset(
            'assets/images/stats.png',
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 40,
          ),
          SummaryCard(
            title: 'Punkty satysfakcji:',
            scores: 20,
          ),
          SummaryCard(
            title: 'Punkty frustracji:',
            scores: 5,
            isPositive: false,
          ),
        ],
      ),
    );
  }
}
