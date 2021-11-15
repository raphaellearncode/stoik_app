import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/model/history_model.dart';
import 'dart:async';
import 'dart:math';

import 'package:stoik_app/widgets/buttons/flat_buttons.dart';

class GameDice extends StatefulWidget {
  const GameDice({Key? key, required this.history}) : super(key: key);

  final HistoryModel history;

  @override
  State<GameDice> createState() => _GameDiceState();
}

class _GameDiceState extends State<GameDice> {
  int diceNumber = 1;

  late Timer timer;

  bool showAnswers = false;

  bool showDice = true;

  void swapPages() {
    setState(() {
      showAnswers = true;

      showDice = false;
    });
  }

  void shuffleDice() {
    setState(() {
      timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
        setState(() {
          diceNumber = Random().nextInt(6) + 1;
        });
      });
    });
  }

  void stopDice() {
    setState(() {
      timer.cancel();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Card(
              color: Colors.grey,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.history.title),
                    SizedBox(
                      height: 20,
                    ),
                    Text('''${widget.history.historyDescription}'''),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              Visibility(
                visible: showAnswers,
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            color: Colors.amber,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: SizedBox(
                              width: 100,
                              height: 160,
                              child: Center(child: Text('Odpowiedź $index')),
                            ),
                          );
                        },
                      ),
                    ),
                    FlatBtn(
                      title: 'Dobierz karty',
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showDice,
                child: Column(
                  children: [
                    Text(
                      'RZUĆ KOSTKĄ',
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset(
                      'assets/images/dice$diceNumber.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlatBtn(
                            title: 'Rzuć kostką',
                            onPress: () {
                              shuffleDice();
                            },
                          ),
                          FlatBtn(
                            title: 'Stop',
                            onPress: () {
                              stopDice();
                              Future.delayed(Duration(milliseconds: 700),
                                  () => swapPages());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
