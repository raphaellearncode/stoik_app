import 'package:flutter/material.dart';
import 'package:stoik_app/providers/settings_provider/settings_provider.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/cards/sets_card.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    int cardHeight = sizeInfo.setsCardHeight;
    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;
    double descriptionSize = sizeInfo.headerSubtitleSize;
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return PaddingWrap(
          key: key,
          contentPage: CustomScrollView(
              key: key,
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
                          child: Text(
                            'Ustawienia:',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: headerFontSize),
                          ))),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 24),
                  sliver: SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeader(
                          paddingHorizontal: 8.0,
                          maxHeight: 42,
                          minHeight: 40,
                          child: Text(
                            'Czas losowania kostki: ',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: titleFontSize),
                          ))),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    ColumnBuilder(
                      itemCount:
                          settingsProvider.diceOptions.diceOptionsListCounter,
                      itemBuilder: (context, index) {
                        final diceOptions =
                            settingsProvider.diceOptions.diceOptionsList[index];
                        return SettingsCard(
                          title: diceOptions.title!,
                          titleSize: cardTitleFontSize,
                          descriptionSize: descriptionSize,
                          cardHeight: cardHeight,
                          description: diceOptions.description!,
                          iconColor: settingsProvider.setShuffleOption == index
                              ? Theme.of(context).indicatorColor
                              : Theme.of(context).unselectedWidgetColor,
                          onTap: () {
                            settingsProvider.setDiceShuffleTime(index);
                          },
                        );
                      },
                    )
                  ]),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 24),
                  sliver: SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeader(
                          paddingHorizontal: 8.0,
                          maxHeight: 42,
                          minHeight: 40,
                          child: Text(
                            'Ilość rozdań w grze: ',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: titleFontSize),
                          ))),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    ColumnBuilder(
                      itemCount:
                          settingsProvider.gameRounds.gameSetOptionsListCounter,
                      itemBuilder: (context, index) {
                        final diceOptions = settingsProvider
                            .gameRounds.gameSetOptionsList[index];
                        return SettingsCard(
                          titleSize: cardTitleFontSize,
                          descriptionSize: descriptionSize,
                          cardHeight: cardHeight,
                          title: diceOptions.title!,
                          description: diceOptions.description!,
                          iconColor: settingsProvider.setGameSetOption == index
                              ? Theme.of(context).indicatorColor
                              : Theme.of(context).unselectedWidgetColor,
                          onTap: () {
                            settingsProvider.setGameRounds(index);
                          },
                        );
                      },
                    )
                  ]),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 100,
                ))
              ]),
        );
      },
    );
  }
}
