import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/stats_provider/stats_provider.dart';
import 'package:stoik_app/widgets/cards/chart_card.dart';
import 'package:stoik_app/widgets/cards/summary_card.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontColor = Colors.black;
    final double barWidth = 7;
    return Consumer<StatsProvider>(
      builder: (context, statsProvider, child) {
        return CustomScrollView(
            key: key,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 24),
                sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverHeader(
                        paddingHorizontal: 8.0,
                        maxHeight: 42,
                        minHeight: 40,
                        child: Text('Statystyki gry',
                            style: Theme.of(context).textTheme.headline1))),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text('Diagram rozgrywek:',
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8.0),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: BarChart(
                              chartData: statsProvider.gameList,
                            )

                            // BarChart(BarChartData(
                            //     alignment: BarChartAlignment.start,
                            //     titlesData: FlTitlesData(
                            //       show: true,
                            //       rightTitles: SideTitles(showTitles: false),
                            //       topTitles: SideTitles(
                            //         showTitles: false,
                            //       ),
                            //       bottomTitles: SideTitles(
                            //         showTitles: true,
                            //         getTextStyles: (context, value) =>
                            //             Theme.of(context).textTheme.subtitle1,
                            //         margin: 5,
                            //       ),
                            //     ),
                            //     borderData: FlBorderData(
                            //       show: false,
                            //     ),
                            //
                            //     // backgroundColor: Theme.of(context).canvasColor,
                            //     gridData: FlGridData(
                            //       drawHorizontalLine: true,
                            //     ),
                            //     barGroups: List.generate(
                            //         statsProvider.gameListCounter, (index) {
                            //       var chartListItem =
                            //           statsProvider.gameList[index];
                            //       return BarChartGroupData(x: index, barRods: [
                            //         BarChartRodData(
                            //             y: chartListItem.scoresPositive!
                            //                 .toDouble(),
                            //             colors: [
                            //               Colors.green,
                            //               Colors.greenAccent
                            //             ],
                            //             width: barWidth,
                            //             borderRadius: BorderRadius.circular(5)),
                            //         BarChartRodData(
                            //             y: chartListItem.scoresNegative!
                            //                 .toDouble(),
                            //             colors: [Colors.red, Colors.redAccent],
                            //             width: barWidth,
                            //             borderRadius: BorderRadius.circular(5)),
                            //       ]);
                            //     }).toList()
                            //     // [
                            //     //   ///1st list item
                            //     //   BarChartGroupData(x: 1, barRods: [
                            //     //     BarChartRodData(
                            //     //         y: 14,
                            //     //         colors: [Colors.green, Colors.greenAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //     BarChartRodData(
                            //     //         y: 10,
                            //     //         colors: [Colors.red, Colors.redAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //   ]),
                            //     //
                            //     //   ///2st list item
                            //     //   BarChartGroupData(x: 2, barRods: [
                            //     //     BarChartRodData(
                            //     //         y: 24,
                            //     //         colors: [Colors.green, Colors.greenAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //     BarChartRodData(
                            //     //         y: 13,
                            //     //         colors: [Colors.red, Colors.redAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //   ]),
                            //     //
                            //     //   ///3st list item
                            //     //   BarChartGroupData(x: 3, barRods: [
                            //     //     BarChartRodData(
                            //     //         y: 8,
                            //     //         colors: [Colors.green, Colors.greenAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //     BarChartRodData(
                            //     //         y: 26,
                            //     //         colors: [Colors.red, Colors.redAccent],
                            //     //         width: barWidth,
                            //     //         borderRadius: BorderRadius.circular(5)),
                            //     //   ]),
                            //     // ]
                            //
                            //     )),
                            ),
                      ),
                    ),
                    Text('Wszystkich razem:',
                        style: Theme.of(context).textTheme.headline1),
                    SummaryCard(
                      title: 'Punkty satysfakcji:',
                      scores: statsProvider.allPositiveScores,
                    ),
                    SummaryCard(
                      title: 'Punkty frustracji:',
                      scores: statsProvider.allNegativeScores,
                      isPositive: false,
                    ),
                  ]),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Image.asset(
              //     'assets/images/stats.png',
              //     width: MediaQuery.of(context).size.width * 0.6,
              //   ),
              // ),
              // SliverToBoxAdapter(
              //     child: Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 200,
              //   child: BarChart(BarChartData(barGroups: [
              //     ///1st list item
              //     BarChartGroupData(x: 1, barRods: [
              //       BarChartRodData(
              //           y: 4,
              //           colors: [Colors.blue, Colors.blueAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //       BarChartRodData(
              //           y: 3,
              //           colors: [Colors.red, Colors.redAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //     ]),
              //
              //     ///2st list item
              //     BarChartGroupData(x: 1, barRods: [
              //       BarChartRodData(
              //           y: 4,
              //           colors: [Colors.blue, Colors.blueAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //       BarChartRodData(
              //           y: 3,
              //           colors: [Colors.red, Colors.redAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //     ]),
              //
              //     ///3st list item
              //     BarChartGroupData(x: 1, barRods: [
              //       BarChartRodData(
              //           y: 4,
              //           colors: [Colors.blue, Colors.blueAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //       BarChartRodData(
              //           y: 3,
              //           colors: [Colors.red, Colors.redAccent],
              //           width: barWidth,
              //           borderRadius: BorderRadius.circular(5)),
              //     ]),
              //   ])),
              // )),
            ]);
      },
    );
    //   Container(
    //   key: key,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    //         child: Text(
    //           'Statystyki ',
    //           style: GoogleFonts.rubik(
    //               fontSize: 30, color: fontColor, fontWeight: FontWeight.w400),
    //         ),
    //       ),
    //       Image.asset(
    //         'assets/images/stats.png',
    //         width: MediaQuery.of(context).size.width,
    //       ),
    //       SizedBox(
    //         height: 40,
    //       ),
    //       SummaryCard(
    //         title: 'Punkty satysfakcji:',
    //         scores: 20,
    //       ),
    //       SummaryCard(
    //         title: 'Punkty frustracji:',
    //         scores: 5,
    //         isPositive: false,
    //       ),
    //     ],
    //   ),
    // );
  }
}
