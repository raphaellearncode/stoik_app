import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SociBtn extends StatelessWidget {
  const SociBtn({Key? key, required this.title, required this.onPress})
      : super(key: key);

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(elevation: MaterialStateProperty.resolveWith(
        (states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.focused,
          };
          if (states.any(interactiveStates.contains)) {
            return 3;
          }
          return 5;
        },
      ), backgroundColor: MaterialStateProperty.resolveWith((states) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
        };
        if (states.any(interactiveStates.contains)) {
          return Colors.amber.shade200;
        }
        return Colors.amber.shade500;
      })),
      onPressed: onPress(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            FontAwesomeIcons.share,
            size: 20,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
