import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';
import 'package:stoik_app/widgets/headers/sliver_header.dart';
import 'package:stoik_app/widgets/wrappers/screen_wrapper.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key, required this.learnData}) : super(key: key);

  final LearnModel learnData;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);

    double headerFontSize = sizeInfo.largeHeaderSize;
    double titleFontSize = sizeInfo.headerTitleSize;
    double cardTitleFontSize = sizeInfo.headerSubtitleSize;
    return Scaffold(
        body: PaddingWrap(
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
                          child: Text(learnData.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: headerFontSize)))),
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
                          Text(
                            learnData.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: titleFontSize),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '''${learnData.description}''',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: cardTitleFontSize),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
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
