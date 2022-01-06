import 'package:flutter/material.dart';
import 'package:stoik_app/widgets/buttons/score_coin.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard(
      {Key? key,
      required this.title,
      required this.scores,
      this.isPositive = true,
      this.fontSize = 16,
      this.coinSize = 30})
      : super(key: key);

  final String title;
  final int scores;
  final bool isPositive;
  final double fontSize;
  final double coinSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Theme.of(context).shadowColor,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScoreCoin(
              isPositive: isPositive,
              coinSize: coinSize,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: fontSize),
            ),
            Text(
              '$scores',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
