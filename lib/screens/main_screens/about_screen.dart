import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/widgets/buttons/soci_button.dart';
import 'package:stoik_app/widgets/cards/logo_card.dart';
import 'package:stoik_app/widgets/headers/newsletter_window.dart';
import 'package:stoik_app/widgets/headers/social_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(
              height: 40,
            ),
            SocialsBar(),
            SizedBox(
              height: 40,
            ),
            Newsletter(),
            SizedBox(
              height: 40,
            ),
            Text(
              'Polityka prywatności',
              style: GoogleFonts.rubik(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200),
            )
          ],
        ));
  }
}
