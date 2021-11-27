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
      this.cardType = 1})
      : super(key: key);

  final int index;
  final int historyNumber;
  final String title;
  final String description;
  final int cardType;
  final bool shrink;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
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
                width: shrink ? 20 : 35,
                height: shrink ? 32 : 45,
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
                                .copyWith(fontSize: shrink ? 13 : 21),
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
      ),
    );
  }
}
