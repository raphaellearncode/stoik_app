import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.child,
  }) : super(key: key);

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var titleFontSize = 12.0; //SizeInfo.settingsCardTitleFontSize;
    var descriptionFontSize = 10.0; //SizeInfo.settingsCardDescriptionFontSize;
    var cardHeight = 60.0; //SizeInfo.settingsCardHeight;
    double smallRingRadiusSize = cardHeight - 17;
    const textPadding = EdgeInsets.symmetric(horizontal: 6.0);

    const marginContainer = EdgeInsets.all(8.0);
    const marginTextBox = EdgeInsets.all(16);

    const radiusContainer = BorderRadius.all(Radius.circular(15));
    const radiusInnerContainer = BorderRadius.all(Radius.circular(10));

    List<Widget> _items = [
      Expanded(
        child: Padding(
          padding: textPadding,
          child: RichText(
            maxLines: 2,
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
      child
    ];
    return Stack(
      key: key,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: cardHeight,
          margin: marginContainer,
          decoration: BoxDecoration(
              borderRadius: radiusContainer,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade700.withOpacity(
                      0.3), //Theme.of(context).unselectedWidgetColor,
                  offset: const Offset(0.0, 0.0),
                ),
                BoxShadow(
                  color: Colors.grey.shade400
                      .withOpacity(0.3), //Theme.of(context).shadowColor,
                  offset: const Offset(0.0, 0.0),
                  spreadRadius: -3.0,
                  blurRadius: 3.0,
                ),
              ]),
        ), //main shape
        Container(
            width: MediaQuery.of(context).size.width,
            height: smallRingRadiusSize,
            margin: marginTextBox,
            decoration: BoxDecoration(
                color: Colors.white, //Theme.of(context).backgroundColor,
                borderRadius: radiusInnerContainer,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade700.withOpacity(
                          0.6), //Theme.of(context).unselectedWidgetColor,
                      blurRadius: 3.0,
                      offset: const Offset(.0, .0),
                      spreadRadius: 2.0),
                  BoxShadow(
                    color: Colors.grey.shade700
                        .withOpacity(0.6), //Theme.of(context).shadowColor,
                    offset: const Offset(0.0, 0.0),
                    spreadRadius: 3.0,
                    blurRadius: 3.0,
                  ),
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _items)),
      ],
    );
  }
}
