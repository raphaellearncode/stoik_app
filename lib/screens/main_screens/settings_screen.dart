import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/settings_provider/settings_provider.dart';
import 'package:stoik_app/widgets/buttons/switch_btn.dart';
import 'package:stoik_app/widgets/cards/sets_card.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return CustomScrollView(
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
                          style: GoogleFonts.rubik(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
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
                          style: GoogleFonts.rubik(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
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
                          style: GoogleFonts.rubik(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ))),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ColumnBuilder(
                    itemCount:
                        settingsProvider.gameRounds.gameSetOptionsListCounter,
                    itemBuilder: (context, index) {
                      final diceOptions =
                          settingsProvider.gameRounds.gameSetOptionsList[index];
                      return SettingsCard(
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
            ]);
        //   Stack(children: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 15),
        //     child: Image.asset(
        //       'assets/images/settings.png',
        //       width: MediaQuery.of(context).size.width,
        //     ),
        //   ),
        //   CustomScrollView(
        //       key: key,
        //       physics: const BouncingScrollPhysics(
        //           parent: AlwaysScrollableScrollPhysics()),
        //       slivers: [
        //         SliverPadding(
        //           padding: const EdgeInsets.only(top: 24),
        //           sliver: SliverPersistentHeader(
        //               pinned: true,
        //               delegate: SliverHeader(
        //                   paddingHorizontal: 8.0,
        //                   maxHeight: 42,
        //                   minHeight: 40,
        //                   child: Text(
        //                     'Ustawienia:',
        //                     style: GoogleFonts.rubik(
        //                         fontSize: 18,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w500),
        //                   ))),
        //         ),
        //         // const SliverToBoxAdapter(
        //         //     child: SizedBox(
        //         //   height: 80,
        //         // )
        //
        //         // Image.asset(
        //         //   'assets/images/settings.png',
        //         //   width: MediaQuery.of(context).size.width,
        //         // ),
        //         //  ),
        //         SliverPadding(
        //           padding: const EdgeInsets.only(top: 24),
        //           sliver: SliverPersistentHeader(
        //               pinned: true,
        //               delegate: SliverHeader(
        //                   paddingHorizontal: 8.0,
        //                   maxHeight: 42,
        //                   minHeight: 40,
        //                   child: Text(
        //                     'Czas losowania kostki: ',
        //                     style: GoogleFonts.rubik(
        //                         fontSize: 15,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w500),
        //                   ))),
        //         ),
        //         SliverList(
        //           delegate: SliverChildListDelegate([
        //             ColumnBuilder(
        //               itemCount:
        //                   settingsProvider.diceOptions.diceOptionsListCounter,
        //               itemBuilder: (context, index) {
        //                 final diceOptions =
        //                     settingsProvider.diceOptions.diceOptionsList[index];
        //                 return SettingsCard(
        //                   title: diceOptions.title!,
        //                   description: diceOptions.description!,
        //                   iconColor: settingsProvider.setShuffleOption == index
        //                       ? Theme.of(context).indicatorColor
        //                       : Theme.of(context).unselectedWidgetColor,
        //                   onTap: () {
        //                     settingsProvider.setDiceShuffleTime(index);
        //                   },
        //                 );
        //               },
        //             )
        //           ]),
        //         ),
        //         SliverPadding(
        //           padding: const EdgeInsets.only(top: 24),
        //           sliver: SliverPersistentHeader(
        //               pinned: true,
        //               delegate: SliverHeader(
        //                   paddingHorizontal: 8.0,
        //                   maxHeight: 42,
        //                   minHeight: 40,
        //                   child: Text(
        //                     'Ilość rozdań w grze: ',
        //                     style: GoogleFonts.rubik(
        //                         fontSize: 15,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w500),
        //                   ))),
        //         ),
        //         SliverList(
        //           delegate: SliverChildListDelegate([
        //             ColumnBuilder(
        //               itemCount:
        //                   settingsProvider.gameRounds.gameSetOptionsListCounter,
        //               itemBuilder: (context, index) {
        //                 final diceOptions = settingsProvider
        //                     .gameRounds.gameSetOptionsList[index];
        //                 return SettingsCard(
        //                   title: diceOptions.title!,
        //                   description: diceOptions.description!,
        //                   iconColor: settingsProvider.setGameSetOption == index
        //                       ? Theme.of(context).indicatorColor
        //                       : Theme.of(context).unselectedWidgetColor,
        //                   onTap: () {
        //                     settingsProvider.setGameRounds(index);
        //                   },
        //                 );
        //               },
        //             )
        //           ]),
        //         ),
        //       ]),
        // ]);
      },
    );
  }
}
