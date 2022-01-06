import 'package:flutter/material.dart';
import 'package:stoik_app/utils/dimensions/dimens.dart';
import 'package:stoik_app/utils/dimensions/screen_type.dart';

class PaddingWrap extends StatelessWidget {
  const PaddingWrap({Key? key, required this.contentPage}) : super(key: key);
  final Widget contentPage;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizeInfo = Dimens(
        screenType: getScreenType(mediaQuery), screenSize: mediaQuery.size);
    var sidePadding = sizeInfo.sideSpacingOnly;
    return Padding(
      padding: sidePadding,
      child: contentPage,
    );
  }
}
