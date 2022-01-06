import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.iconColor,
    this.cardHeight = 60,
    required this.titleSize,
    required this.descriptionSize,
  }) : super(key: key);

  final String title;
  final String description;
  final Function onTap;
  final Color iconColor;
  final int cardHeight;
  final double titleSize;
  final double descriptionSize;

  @override
  Widget build(BuildContext context) {
    double smallRingRadiusSize = cardHeight - 17;
    const textPadding = EdgeInsets.symmetric(horizontal: 6.0);

    const innerPadding = EdgeInsets.all(5.0);
    const marginTextBox = EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0);

    List<Widget> _items = [
      Expanded(
        child: Padding(
          padding: textPadding,
          child: RichText(
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '$title\n',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: titleSize, fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: description,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: descriptionSize,
                        height: 1.5,
                        fontWeight: FontWeight.w300),
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
          icon: Icon(FontAwesomeIcons.powerOff,
              size: titleSize + 3, color: iconColor))
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
  }
}
