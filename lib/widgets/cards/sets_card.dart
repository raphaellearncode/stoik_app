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
    return Card(
      elevation: 3,
      margin: marginTextBox,
      shadowColor: Theme.of(context).shadowColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      )),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: smallRingRadiusSize,

          // decoration: BoxDecoration(
          //     color: Colors.white, //Theme.of(context).backgroundColor,
          //     borderRadius: radiusInnerContainer,
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.grey.shade500.withOpacity(
          //               0.6), //Theme.of(context).unselectedWidgetColor,
          //           blurRadius: 2.0,
          //           offset: const Offset(.2, .2),
          //           spreadRadius: 1.0),
          //     ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _items)),
    );
  }
}
