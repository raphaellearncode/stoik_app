import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/education_page.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_rules_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';

class IntroD extends StatelessWidget {
  const IntroD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, EducationProvider>(
      builder: (context, homeProvider, eduProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/survey.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Text(
                'Najważniejsze informacje\n w skrócie znajdziesz tutaj: ',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    height: 1.5, fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: EducationCard(
                      title: homeProvider.gameTitleList[0].title,
                      assetPath: homeProvider.gameTitleList[0].assetPath,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            CustomPageRoute(
                                child: const GameRulesScreen(),
                                direction: AxisDirection.left));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: EducationCard(
                      title: eduProvider.educationList[0].title,
                      assetPath: eduProvider.educationList[0].assetPath,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            CustomPageRoute(
                                child: EducationPage(
                                  learnData: eduProvider.educationList[0],
                                ),
                                direction: AxisDirection.left));
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
