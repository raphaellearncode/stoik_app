import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stoik_app/widgets/buttons/switch_btn.dart';
import 'package:stoik_app/widgets/cards/sets_card.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/settings.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ColumnBuilder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SettingsCard(
                    title: 'Opcje pytań',
                    description: index == 1
                        ? '10 pytań w rozdaniu'
                        : '15 pytań w rozdaniu',
                    child: SwitchBtn(
                        icon: FontAwesomeIcons.powerOff,
                        value: index == 1 ? true : false,
                        onChanged: (val) {}),
                  );
                },
              )
            ]),
          ),
        ]);
  }
}
