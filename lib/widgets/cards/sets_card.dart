import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.iconColor,
  }) : super(key: key);

  final String title;
  final String description;
  final Function onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    var titleFontSize = 12.0; //SizeInfo.settingsCardTitleFontSize;
    var descriptionFontSize = 10.0; //SizeInfo.settingsCardDescriptionFontSize;
    var cardHeight = 60.0; //SizeInfo.settingsCardHeight;
    var iconSize = 15.0;
    double smallRingRadiusSize = cardHeight - 17;
    const textPadding = EdgeInsets.symmetric(horizontal: 6.0);

    const innerPadding = EdgeInsets.all(5.0);
    const marginTextBox = EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0);

    List<Widget> _items = [
      Expanded(
        child: Padding(
          padding: textPadding,
          child: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '$title\n',
                style: GoogleFonts.rubik(
                    fontSize: titleFontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                //
                // Theme.of(context)
                //     .textTheme
                //     .headline2!
                //     .copyWith(fontSize: titleFontSize),
                children: <TextSpan>[
                  TextSpan(
                    text: description,
                    style: GoogleFonts.rubik(
                        fontSize: descriptionFontSize,
                        color: Colors.black,
                        height: 1.5,
                        fontWeight: FontWeight.w300),

                    // Theme.of(context)
                    //     .textTheme
                    //     .bodyText1!
                    //     .copyWith(fontSize: descriptionFontSize),
                  )
                ]),
          ),
        ),
      ),
      IconButton(
          alignment: Alignment.center,
          onPressed: () {
            onTap();
          },
          splashRadius: 10,
          splashColor: Colors.transparent,
          icon:
              Icon(FontAwesomeIcons.powerOff, size: iconSize, color: iconColor))
      //child
    ];
    return Card(
      margin: marginTextBox,
      child: Padding(
        padding: innerPadding,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: smallRingRadiusSize,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _items)),
      ),
    );
    //   ClipRRect(
    //   borderRadius: const BorderRadius.only(
    //     topLeft: Radius.circular(10),
    //     topRight: Radius.circular(10),
    //     bottomRight: Radius.circular(10),
    //   ),
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    //     child: Card(
    //       margin: marginTextBox,
    //       child: Padding(
    //         padding: innerPadding,
    //         child: SizedBox(
    //             width: MediaQuery.of(context).size.width,
    //             height: smallRingRadiusSize,
    //             child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: _items)),
    //       ),
    //     ),
    //   ),
    // );
  }
}
