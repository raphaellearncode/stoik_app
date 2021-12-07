import 'package:flutter/material.dart';

class GamePlayCard extends StatelessWidget {
  const GamePlayCard(
      {Key? key,
      required this.index,
      required this.historyNumber,
      required this.title,
      required this.description,
      this.shrink = false,
      required this.heroTag,
      this.isCardUsed = false,
      this.cardType = 1})
      : super(key: key);

  final int index;
  final int historyNumber;
  final String title;
  final String description;
  final int cardType;
  final bool shrink;
  final String heroTag;
  final bool isCardUsed;

  @override
  Widget build(BuildContext context) {
    return isCardUsed
        ? Card(
            color: Colors.grey.withOpacity(0.7),
            elevation: 3,
            shadowColor: Theme.of(context).shadowColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Text('Wykorzystana odpowiedz'),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/card_${cardType == 1 ? 'history' : cardType == 2 ? 'answear' : 'random'}.png',
                    ),
                  ),
                ],
              ),
            ),
          )
        : Hero(
            tag: heroTag,
            child: Card(
              color: Theme.of(context).canvasColor,
              elevation: 3,
              shadowColor: Theme.of(context).shadowColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: shrink ? 18 : 30,
                      height: shrink ? 28 : 38,
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.only(top: 10),
                      color: Theme.of(context).backgroundColor,
                      child: Text(
                        '$historyNumber',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: shrink ? 18 : 23),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RotatedBox(
                            quarterTurns: -1,
                            child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: 'KARTA\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: shrink ? 10 : 18),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${cardType == 1 ? 'HISTORII' : cardType == 2 ? 'ODPOWIEDZI' : 'LOSOWA'}',
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/card_${cardType == 1 ? 'history' : cardType == 2 ? 'answear' : 'random'}.png',
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
