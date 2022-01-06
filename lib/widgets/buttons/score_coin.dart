import 'package:flutter/material.dart';

class ScoreCoin extends StatelessWidget {
  const ScoreCoin({Key? key, this.isPositive = true, required this.coinSize})
      : super(key: key);

  final bool isPositive;
  final double coinSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: coinSize,
      height: coinSize,
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(coinSize / 2)),
          color: isPositive
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorLight,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(1.5, 1.5),
                blurRadius: 2.5)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(coinSize / 2)),
        child: Image.asset(
          'assets/images/coins_${isPositive ? 'positive' : 'negative'}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
