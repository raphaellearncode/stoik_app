import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/providers/stats_provider/stats_provider.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/chart_card.dart';
import 'package:stoik_app/widgets/cards/summary_card.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double cardHeight = sizeInfo.chartCardHeight;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;
    double coinSize = sizeInfo.coinSize;
    int chartFont = sizeInfo.chartFontSize.toInt();
    return PaddingWrap(
      key: key,
      contentPage: Consumer2<StatsProvider, GameProvider>(
        builder: (context, statsProvider, gameProvider, child) {
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: headerFontSize)))),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: Image.asset(
                      'assets/images/winners.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text('Diagram rozgrywek:',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: titleFontSize)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: cardHeight,
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: BarChart(
                                chartData: gameProvider.gameList,
                                fontSize: chartFont,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: coinSize,
                      ),
                      Text('Wszystkich razem:',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: titleFontSize)),
                      SummaryCard(
                        title: 'Punkty satysfakcji:',
                        scores: gameProvider.allPositiveScores,
                        coinSize: coinSize,
                        fontSize: cardTitleFontSize,
                      ),
                      SummaryCard(
                        title: 'Punkty frustracji:',
                        scores: gameProvider.allNegativeScores,
                        isPositive: false,
                        coinSize: coinSize,
                        fontSize: cardTitleFontSize,
                      ),
                    ]),
                  ),
                ),
              ]);
        },
      ),
    );
  }
}
