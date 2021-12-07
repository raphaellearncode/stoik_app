import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoik_app/providers/export_providers.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';

class StoicPage extends StatelessWidget {
  const StoicPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer<EducationProvider>(
          builder: (context, provider, child) {
            const textPadding =
                EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0);
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
                            child: Text(title,
                                style: Theme.of(context).textTheme.headline1))),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      ColumnBuilder(
                        itemCount: provider.stoicListCounter,
                        itemBuilder: (context, index) {
                          final sociList = provider.stoicList[index];
                          return Padding(
                            padding: textPadding,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Card(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          sociList.assetPath,
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 120,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        sociList.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  sociList.description,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ]),
                  ),
                ]);
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