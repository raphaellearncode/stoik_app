import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/education_provider/education_provider.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/education_page.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/stoic_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    int axisCount = sizeInfo.gridColumnCount;
    double crossSpacing = sizeInfo.axisSpacing;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;
    return Consumer<EducationProvider>(
      builder: (context, providerData, child) {
        return PaddingWrap(
          key: key,
          contentPage: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: Text('Edukacja',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: headerFontSize)),
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: crossSpacing,
                    shrinkWrap: true,
                    mainAxisSpacing: crossSpacing,
                    crossAxisCount: axisCount,
                    childAspectRatio: 1,
                    children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => ScaleAnimation(
                              scale: 0.5,
                              child: FadeInAnimation(child: widget),
                            ),
                        children: List.generate(
                            providerData.educationListCounter, (index) {
                          final list = providerData.educationList[index];
                          return EducationCard(
                            title: list.title,
                            assetPath: list.assetPath,
                            fontSize: cardTitleFontSize,
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: index != 1
                                          ? EducationPage(
                                              learnData: list,
                                            )
                                          : StoicPage(
                                              title: list.title,
                                            ),
                                      direction: AxisDirection.up));
                            },
                          );
                        })),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
