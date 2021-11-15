import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/data/history_data/history_list.dart';
import 'package:stoik_app/utils/custom_page_route.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';

import 'game_dice_page.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //https://github.com/flutter/flutter/issues/49549
            //https://stackoverflow.com/questions/60037990/how-do-i-convert-a-scrolling-view-into-a-listview-in-flutter
            Text(
              'LOSUJ KARTĘ',
              style: GoogleFonts.rubik(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 5,
                        color: Colors.grey,
                        child: SizedBox(
                          width: 200,
                          child: Center(
                            child:
                                Text('Historia $index z ${historyList.length}'),
                          ),
                        ),
                      ),
                      onTap: () async {
                        await Navigator.push(
                            context,
                            CustomPageRoute(
                                child: GameDice(
                                  history: historyList[index],
                                ),
                                direction: AxisDirection.up));
                      },
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatBtn(
                    title: 'Powrót',
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatBtn(
                    title: 'Przetasuj',
                    onPress: () {
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
