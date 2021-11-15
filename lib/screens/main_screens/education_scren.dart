import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/data/learning_list.dart';
import 'package:stoik_app/screens/secondary_screens/education_page/education_page.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Text(
              'Edukacja',
              style: GoogleFonts.rubik(fontSize: 30, color: Colors.black),
            ),
          ),
          Expanded(
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
                children: List.generate(learningData.length, (index) {
                  final list = learningData[index];
                  return EducationCard(
                    icon: list.icon,
                    title: list.title,
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
          )
        ],
      ),
    );
  }
}
