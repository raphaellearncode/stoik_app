import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/providers/rules_provider/rules_provider.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<RulesProvider>(
          builder: (context, provider, child) {
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
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        height: 1.8,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
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
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        height: 1.8,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
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
                    // SliverToBoxAdapter(
                    //   child: FlatBtn(
                    //     title: 'Rozumiem',
                    //     onPress: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ),
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
          child: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ));
  }
}
