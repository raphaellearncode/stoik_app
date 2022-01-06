import 'package:flutter/material.dart';
import 'package:stoik_app/screens/secondary_screens/policy_screen/policy_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:stoik_app/widgets/cards/logo_card.dart';
import 'package:stoik_app/widgets/headers/social_bar.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var socialPadding = 5.0;
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);
    double socialIconSize = sizeInfo.sociIconsDimen;
    var titleSize = sizeInfo.headerTitleSize;
    var socialSubtitleFontSize = sizeInfo.headerSubtitleSize;
    var logoCardSize = sizeInfo.logoCardSize;
    var logoCardMargin = sizeInfo.logoCardMargin;
    var cardBorderRadius = sizeInfo.cardBorderRadius;
    var betweenSpacing = sizeInfo.betweenSpacing;
    return PaddingWrap(
      key: key,
      contentPage: Container(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: betweenSpacing,
                ),
              ),
              Logo(
                cardBorderRadius: cardBorderRadius,
                logoCardMargin: logoCardMargin,
                logoCardSize: logoCardSize,
                logoTitleSize: titleSize,
                logoSubtitleSize: socialSubtitleFontSize,
              ),
              SizedBox(
                height: betweenSpacing,
              ),
              SocialsBar(
                socialIconSize: socialIconSize,
                socialPadding: socialPadding,
                socialSubtitleFontSize: socialSubtitleFontSize,
              ),
              Expanded(
                child: SizedBox(
                  height: betweenSpacing,
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
                fontSize: socialSubtitleFontSize,
                onPress: () async {
                  await Navigator.push(
                      context,
                      CustomPageRoute(
                          child: const PolicyScreen(),
                          direction: AxisDirection.up));
                },
              ),
            ],
          )),
    );
  }
}
