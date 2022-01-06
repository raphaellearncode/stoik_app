import 'package:charts_flutter/flutter.dart' as charts;

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stoik_app/data/fake_chart_data.dart';
import 'package:stoik_app/model/db_game_model.dart';
import 'package:stoik_app/utils/charts_colors.dart';

class BarChart extends StatelessWidget {
  final List<Game> chartData;
  final int fontSize;
  final MaterialAccentColor colorPosBar;
  final MaterialAccentColor colorNegBar;

  const BarChart(
      {Key? key,
      required this.chartData,
      this.fontSize = 7,
      this.colorPosBar = Colors.greenAccent,
      this.colorNegBar = Colors.redAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series(
        measureOffsetFn: (_, __) => 2,
        strokeWidthPxFn: (_, __) => 1,
        overlaySeries: false,
        colorFn: (_, __) => getChartColor(colorPosBar[400]!),
        fillColorFn: (_, __) => getChartColor(colorPosBar[200]!),
        domainFn: (Game data, _) => DateFormat('d MMM yy \n h:m:s').format(
            DateTime.fromMicrosecondsSinceEpoch(data.date!
                .toInt())), //DateTime.fromMicrosecondsSinceEpoch(data.date.toInt())
        measureFn: (Game data, _) => data.scoresPositive,

        insideLabelStyleAccessorFn: (Game data, _) {
          final color = getChartColor(Colors.black);

          return charts.TextStyleSpec(
              fontSize: fontSize, color: color, lineHeight: 1);
        },
        labelAccessorFn: (Game data, _) => data.scoresPositive.toString(),
        id: 'data',
        data: chartData.isEmpty ? fakeChartData : chartData,
      ),
      charts.Series(
        measureOffsetFn: (_, __) => 2,
        strokeWidthPxFn: (_, __) => 1,
        overlaySeries: false,
        colorFn: (_, __) => getChartColor(colorNegBar[400]!),
        fillColorFn: (_, __) => getChartColor(colorNegBar[200]!),
        domainFn: (Game data, _) => DateFormat('d MMM yy \n h:m:s').format(
            DateTime.fromMicrosecondsSinceEpoch(data.date!
                .toInt())), //DateTime.fromMicrosecondsSinceEpoch(data.date.toInt())
        measureFn: (Game data, _) => data.scoresNegative,

        insideLabelStyleAccessorFn: (Game data, _) {
          final color = getChartColor(Colors.black);

          return charts.TextStyleSpec(
              fontSize: fontSize, color: color, lineHeight: 1);
        },
        labelAccessorFn: (Game data, _) => data.scoresNegative.toString(),
        id: 'data',
        data: chartData.isEmpty ? fakeChartData : chartData,
      ),
    ];

    var barChart = charts.BarChart(
      series,
      animate: true,

      barGroupingType: charts.BarGroupingType.grouped,
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(15),
      ),

      behaviors: [
        charts.DomainHighlighter(),
        charts.SelectNearest(),
        charts.SlidingViewport(),
        charts.PanAndZoomBehavior(),
      ],
      defaultInteractions: false,
      defaultRenderer: charts.BarRendererConfig(
          //strokeWidthPx: 0.7,
          minBarLengthPx: 5,
          weightPattern: [5, 5],
          cornerStrategy:
              const charts.ConstCornerStrategy(0)), //rounded bars in chart
      //OS Y
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false, //show y axis line

        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            zeroBound: true), //setting bounds for charts they don't overlapping
        renderSpec: charts.GridlineRendererSpec(
          lineStyle: charts.LineStyleSpec(
            color: getChartColor(Colors.black),
            dashPattern: const [4, 4],
          ),
        ),
      ),

      secondaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false, //show y axis line
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            zeroBound: true), //setting bounds for charts they don't overlapping
        renderSpec: charts.GridlineRendererSpec(
          lineStyle: charts.LineStyleSpec(
            color: getChartColor(Colors.black),
            dashPattern: const [4, 4],
          ),
        ),
      ),

      //OS X
      domainAxis: charts.OrdinalAxisSpec(
        showAxisLine: false, //show x axis line
        viewport: charts.OrdinalViewport(' ', 5),

        renderSpec: charts.SmallTickRendererSpec(
            tickLengthPx: 2,
            labelAnchor: charts.TickLabelAnchor.centered,
            labelJustification: charts.TickLabelJustification.inside,
            minimumPaddingBetweenLabelsPx: 3,
            lineStyle: charts.LineStyleSpec(
              thickness: 1,
              color: getChartColor(colorPosBar),
              dashPattern: const [4, 4], //linia przerywana
            ),
            // Tick and Label styling here.
            labelStyle: charts.TextStyleSpec(
                fontSize: fontSize + 1,
                color: charts.ColorUtil.fromDartColor(Colors.black))),
      ),
    );

    return ClipRect(
      child: Container(
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(flex: 1, child: barChart),
          ],
        ),
      ),
    );
  }
} //END OF BAR CHART
