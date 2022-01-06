import 'package:flutter/material.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/education_card.dart';
import 'package:stoik_app/widgets/web_link_page/web_link.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class InProgress extends StatelessWidget {
  const InProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double cardSize = sizeInfo.eduCardSize;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: PaddingWrap(
          key: key,
          contentPage: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Gra online \n w trakcie budowy...',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: headerFontSize),
              ),
              Image.asset(
                'assets/images/building.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Text('Bądź na bierząco,\n zamów newsletter',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: titleFontSize)),
              SizedBox(
                width: cardSize,
                height: cardSize,
                child: EducationCard(
                  title: 'Odwiedź nas',
                  assetPath: 'assets/images/newsletter.png',
                  fontSize: titleFontSize,
                  onTap: () async {
                    await Navigator.push(
                        context,
                        CustomPageRoute(
                            child: const Web(
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
