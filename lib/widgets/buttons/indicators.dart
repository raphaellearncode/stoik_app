import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Indicators extends StatelessWidget {
  final ValueNotifier<int> currentPageNotifier;
  final int itemCount;
  final double dotSize;

  const Indicators(
      {Key? key,
      required this.currentPageNotifier,
      required this.itemCount,
      this.dotSize = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CirclePageIndicator(
      size: dotSize,
      selectedSize: dotSize + 2,
      currentPageNotifier: currentPageNotifier,
      itemCount: itemCount,
      dotColor: Theme.of(context).unselectedWidgetColor,
      selectedDotColor: Theme.of(context).indicatorColor,
    );
  }
}
