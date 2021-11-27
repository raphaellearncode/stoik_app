import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/widgets/buttons/score_coin.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard(
      {Key? key,
      required this.title,
      required this.scores,
      this.isPositive = true})
      : super(key: key);

  final String title;
  final int scores;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Theme.of(context).shadowColor,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScoreCoin(
              isPositive: isPositive,
            ),
            // CircleAvatar(
            //   radius: 15,
            //   backgroundColor: isPositive
            //       ? Colors.greenAccent.shade400
            //       : Colors.redAccent.shade400,
            //   child: Icon(
            //     isPositive
            //         ? FontAwesomeIcons.thumbsUp
            //         : FontAwesomeIcons.thumbsDown,
            //     size: 13,
            //     color: Colors.black,
            //   ),
            // ),
            Text(
              title,
              style: GoogleFonts.rubik(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '$scores',
              style: GoogleFonts.rubik(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
