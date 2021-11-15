import 'package:flutter/material.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_rules_page.dart';
import 'package:stoik_app/screens/secondary_screens/game_screen/game_screen.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:stoik_app/widgets/cards/logo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Logo(),
        SizedBox(
          height: 30,
        ),
        FlatBtn(
          title: 'Zasady gry',
          onPress: () async {
            await Navigator.push(
                context,
                CustomPageRoute(
                    child: GameRulesScreen(), direction: AxisDirection.up));
          },
        ),
        SizedBox(
          height: 10,
        ),
        FlatBtn(
          title: 'Gra pojedyncza',
          onPress: () async {
            await Navigator.push(
                context,
                CustomPageRoute(
                    child: GameScreen(), direction: AxisDirection.up));
          },
        ),
        SizedBox(
          height: 10,
        ),
        FlatBtn(
          title: 'Gra online',
          onPress: () async {
            await Navigator.push(
                context,
                CustomPageRoute(
                    child: GameScreen(), direction: AxisDirection.up));
          },
        ),
      ],
    );
  }
}
