import 'package:flutter/material.dart';

class ScoreCoin extends StatelessWidget {
  const ScoreCoin({Key? key, this.isPositive = true}) : super(key: key);

  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
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
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Image.asset(
          'assets/images/coins_${isPositive ? 'positive' : 'negative'}.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    // CircleAvatar(
    //   radius: 15,
    //   backgroundColor: isPositive
    //       ? Theme.of(context).primaryColor
    //       : Theme.of(context).primaryColorLight,
    //   child: Image.asset(
    //     'assets/images/coins_${isPositive ? 'positive' : 'negative'}.png',
    //     fit: BoxFit.cover,
    //   ),
    // );
  }
}
