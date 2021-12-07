import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/screens/secondary_screens/policy_screen/policy_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
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
            Expanded(
              child: SizedBox(
                height: 40,
              ),
            ),
            Logo(),
            SizedBox(
              height: 40,
            ),
            SocialsBar(),
            Expanded(
              child: SizedBox(
                height: 40,
              ),
            ),
            // Newsletter(),
            // SizedBox(
            //   height: 40,
            // ),
            FlatBtn(
              title: 'Polityka prywatności',
              color: Colors.transparent,
              elevation: 0,
              textColor: Colors.grey.shade600,
              onPress: () async {
                await Navigator.push(
                    context,
                    CustomPageRoute(
                        child: const PolicyScreen(),
                        direction: AxisDirection.up));
              },
            ),
          ],
        ));
  }
}
