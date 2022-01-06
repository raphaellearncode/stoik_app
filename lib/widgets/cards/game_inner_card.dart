import 'package:flutter/material.dart';

class GameInnerCard extends StatelessWidget {
  const GameInnerCard(
      {Key? key,
      this.cardType = 1,
      required this.historyNumber,
      required this.title,
      required this.description})
      : super(key: key);

  final String historyNumber;
  final String title;
  final String description;
  final int cardType;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardType == 1
          ? Theme.of(context).focusColor
          : cardType == 2
              ? Theme.of(context).backgroundColor
              : Theme.of(context).primaryColorDark,
      elevation: 3,
      shadowColor: Theme.of(context).shadowColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 45,
                // height: 45,
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                color: Theme.of(context).canvasColor,
                child: Text(
                  '$historyNumber',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: cardType == 1
                          ? Theme.of(context).focusColor
                          : Theme.of(context).backgroundColor,
                      letterSpacing: 0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).canvasColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                '''${description}''',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 12, color: Theme.of(context).canvasColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
