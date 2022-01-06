import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer2<RulesProvider, GameProvider>(
          builder: (context, provider, gameProvider, child) {
            double colMarginVertical = 10.0;
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              key: key,
              child: CustomScrollView(
                  key: key,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 24),
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeader(
                              paddingHorizontal: 0.0,
                              maxHeight: 42,
                              minHeight: 40,
                              child: Text(
                                '„STOLIK” - informacje o grze',
                                style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ColumnBuilder(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          itemCount: provider.gameAssetsListCounter,
                          itemBuilder: (context, index) {
                            final assets = provider.gameAssets[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: colMarginVertical),
                              child: RichText(
                                text: TextSpan(
                                    text: '${assets.title} \n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 14,
                                            height: 1.8,
                                            fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                          text: assets.description),
                                    ]),
                              ),
                            );
                          },
                        ),
                      ]),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 24),
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeader(
                              paddingHorizontal: 0.0,
                              maxHeight: 42,
                              minHeight: 40,
                              child: Text(
                                'ZASADY GRY:',
                                style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ColumnBuilder(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          itemCount: provider.rulesListCounter,
                          itemBuilder: (context, index) {
                            final rules = provider.rulesList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: colMarginVertical),
                              child: RichText(
                                text: TextSpan(
                                    text: '${rules.title} \n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 14,
                                            height: 1.8,
                                            fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                          text: rules.description),
                                    ]),
                              ),
                            );
                          },
                        ),
                      ]),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 24),
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeader(
                              paddingHorizontal: 0.0,
                              maxHeight: 42,
                              minHeight: 40,
                              child: Text(
                                'PRZEBIEG TURY:',
                                style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ColumnBuilder(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          itemCount: provider.roundExampleListCounter,
                          itemBuilder: (context, index) {
                            final rules = provider.roundExampleList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: colMarginVertical),
                              child: RichText(
                                text: TextSpan(
                                    text: '${rules.title} \n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 14,
                                            height: 1.8,
                                            fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                          text: rules.description),
                                    ]),
                              ),
                            );
                          },
                        ),
                      ]),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 24),
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeader(
                              paddingHorizontal: 0.0,
                              maxHeight: 42,
                              minHeight: 40,
                              child: Text(
                                'TABELA PUNKTÓW:',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                              ))),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 0),
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeader(
                              paddingHorizontal: 0.0,
                              maxHeight: 42,
                              minHeight: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'Punkty satysfakcji',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Colors.redAccent,
                                  ),
                                  Text(
                                    'Punkty frustracji',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ))),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ColumnBuilder(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          itemCount: gameProvider.historyListCounter,
                          itemBuilder: (context, index) {
                            final scores =
                                gameProvider.historyList[index].answers;
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: .0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top:
                                          const BorderSide(color: Colors.black),
                                      left:
                                          const BorderSide(color: Colors.black),
                                      right: scores.last.id == scores.length
                                          ? const BorderSide(
                                              color: Colors.black)
                                          : BorderSide.none,
                                      bottom: scores.last.id == scores.length
                                          ? const BorderSide(
                                              color: Colors.black)
                                          : BorderSide.none,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'Historia nr: ${gameProvider.historyList[index].id} '),
                                      ),
                                      RowBuilder(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        itemCount: scores.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 2.0),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  left: const BorderSide(
                                                      color: Colors.black),
                                                  right: index == scores.length
                                                      ? const BorderSide(
                                                          color: Colors.black)
                                                      : BorderSide.none),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(scores[index].answerTag),
                                                Opacity(
                                                  opacity: scores[index]
                                                              .scoresPositive ==
                                                          0
                                                      ? 0
                                                      : 1,
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.circle,
                                                        size: 12,
                                                        color: Colors.green,
                                                      ),
                                                      Text(
                                                          ' x ${scores[index].scoresPositive}'),
                                                    ],
                                                  ),
                                                ),
                                                Opacity(
                                                  opacity: scores[index]
                                                              .scoresNegative ==
                                                          0
                                                      ? 0
                                                      : 1,
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.circle,
                                                        size: 12,
                                                        color: Colors.redAccent,
                                                      ),
                                                      Text(
                                                          ' x ${scores[index].scoresNegative}'),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ]),
                    ),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 100,
                    ))
                  ]),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ));
  }
}
