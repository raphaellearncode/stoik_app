import 'package:flutter/material.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:stoik_app/widgets/web_link_page/web_link.dart';

class InProgress extends StatelessWidget {
  const InProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Gra online \n w trakcie budowy...',
                style: Theme.of(context).textTheme.headline1,
              ),
              Image.asset(
                'assets/images/building.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Text('Bądź na bierząco,\n zamów newsletter',
                  style: Theme.of(context).textTheme.headline1),
              SizedBox(
                width: 120,
                height: 120,
                child: EducationCard(
                  title: 'Odwiedź nas',
                  assetPath: 'assets/images/newsletter.png',
                  onTap: () async {
                    await Navigator.push(
                        context,
                        CustomPageRoute(
                            child: Web(
                              link: 'https://stoikapp.herokuapp.com/',
                            ),
                            direction: AxisDirection.up));
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ));
  }
}
