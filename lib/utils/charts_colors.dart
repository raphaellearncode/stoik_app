import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

charts.Color getChartColor(Color color) {
  return charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

charts.Color getChartColorFromHex(String hex) {
  return charts.Color.fromHex(code: hex);
}
