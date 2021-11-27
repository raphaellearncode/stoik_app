import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/education_provider/education_provider.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/education_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:provider/provider.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EducationProvider>(
      builder: (context, providerData, child) {
        return Container(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  'Edukacja',
                  style: GoogleFonts.rubik(fontSize: 30, color: Colors.black),
                ),
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                    padding: const EdgeInsets.all(5.0),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    //isGrid == true ? Axis.vertical : Axis.horizontal,
                    crossAxisSpacing: 5.0,
                    shrinkWrap: true,
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 2,
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
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: EducationPage(
                                        learnData: list,
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
