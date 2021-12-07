import 'package:flutter/material.dart';
import 'package:stoik_app/providers/education_provider/education_provider.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/education_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:provider/provider.dart';

class IntroC extends StatelessWidget {
  const IntroC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EducationProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/meditation.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              RichText(
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: 'Jak zacząć? \n',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        height: 1.5, fontWeight: FontWeight.w400, fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '''Zanim zaczniesz grać zachęcamy do zapoznania się z filozofią stoicyzmu :)''',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            height: 1.5,
                            fontWeight: FontWeight.w200,
                            fontSize: 18),
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: EducationCard(
                  title: provider.educationList[0].title,
                  assetPath: provider.educationList[0].assetPath,
                  onTap: () async {
                    await Navigator.push(
                        context,
                        CustomPageRoute(
                            child: EducationPage(
                              learnData: provider.educationList[0],
                            ),
                            direction: AxisDirection.left));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
