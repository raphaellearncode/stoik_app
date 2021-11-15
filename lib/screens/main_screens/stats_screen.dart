import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontColor = Colors.black;
    return Container(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'STATYSTYKI ',
            style: GoogleFonts.rubik(
                fontSize: 30, color: fontColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Odpowiedzi pozytywne:',
            style: GoogleFonts.rubik(
                fontSize: 18, color: fontColor, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.greenAccent.shade400,
                child: Icon(
                  FontAwesomeIcons.thumbsUp,
                  size: 15,
                  color: fontColor,
                ),
              ),
              Text(
                '20',
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    color: fontColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Odpowiedzi negatywne:',
            style: GoogleFonts.rubik(
                fontSize: 18, color: fontColor, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.redAccent.shade400,
                child: Icon(
                  FontAwesomeIcons.thumbsDown,
                  size: 15,
                  color: fontColor,
                ),
              ),
              Text(
                '12',
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    color: fontColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
