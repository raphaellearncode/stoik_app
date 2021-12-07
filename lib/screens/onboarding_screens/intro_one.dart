import 'package:flutter/material.dart';

class IntroA extends StatelessWidget {
  const IntroA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/love.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            flex: 1,
            child: RichText(
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: 'Cześć,\n',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 23),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '''dziękujemy za pobranie `STOLIK-a`,\nmamy nadzieję, że ta aplikacja wniesie coś pozytywnego do Twojej codzienności :) \nW kolejnych krokach pokażemy kilka ważnych elementów aplikacji dla większej swobody poruszania się po niej.''',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w200,
                          fontSize: 18),

                      // Theme.of(context)
                      //     .textTheme
                      //     .bodyText1!
                      //     .copyWith(fontSize: descriptionFontSize),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
