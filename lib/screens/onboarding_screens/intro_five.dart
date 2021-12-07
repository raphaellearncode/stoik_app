import 'package:flutter/material.dart';

class IntroE extends StatelessWidget {
  const IntroE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/people.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            child: RichText(
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: 'To wszystko!\n',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      height: 1.8, fontWeight: FontWeight.w400, fontSize: 23),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Osiągnij `stoicki spokój`,\ngraj, ucz się,\npopraw jakość swojego życia i\n',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          height: 1.2,
                          fontWeight: FontWeight.w200,
                          fontSize: 18),
                    ),
                    TextSpan(
                      text: 'odstresuj się!',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          height: 1.2,
                          fontWeight: FontWeight.w200,
                          fontSize: 23),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
