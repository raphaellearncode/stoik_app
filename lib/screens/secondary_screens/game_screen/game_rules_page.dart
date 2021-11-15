import 'package:flutter/material.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Zasady gry'),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    int ruleNumber = index + 1;
                    return RichText(
                      text: TextSpan(
                          text: '$ruleNumber) Zasada $ruleNumber \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                text:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n'),
                          ]),
                    );
                  }),
            ),
            FlatBtn(
              title: 'Back',
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
