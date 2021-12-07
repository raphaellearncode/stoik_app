import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/widgets/buttons/flat_buttons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key, required this.learnData}) : super(key: key);

  final LearnModel learnData;

  @override
  Widget build(BuildContext context) {
    const textPadding = EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0);
    return Scaffold(
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
                        child: Text(learnData.title,
                            style: Theme.of(context).textTheme.headline1))),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    key: key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          learnData.assetPath,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(learnData.title),
                        SizedBox(
                          height: 30,
                        ),
                        Text('''${learnData.description}'''),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]),
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
