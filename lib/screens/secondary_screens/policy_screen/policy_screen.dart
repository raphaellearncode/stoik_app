import 'package:flutter/material.dart';
import 'package:stoik_app/providers/onboarding_provider/onboarding_provider.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/list_builders/col_row_builder.dart';
import 'package:provider/provider.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) {
        const textPadding = EdgeInsets.symmetric(horizontal: 6.0);
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: CustomScrollView(
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
                            child: Text('Polityka Prywatności',
                                style: Theme.of(context).textTheme.headline1))),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      ColumnBuilder(
                        itemCount: provider.policyListCounter,
                        itemBuilder: (context, index) {
                          final policyList = provider.policyList[index];
                          return Padding(
                            padding: textPadding,
                            child: RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: '${policyList.title} \n',
                                  style: Theme.of(context).textTheme.headline1,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: policyList.description,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  ]),
                            ),
                          );
                        },
                      )
                    ]),
                  ),
                ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
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
      },
    );
  }
}
