import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatBtn extends StatelessWidget {
  const FlatBtn(
      {Key? key,
      required this.title,
      required this.onPress,
      this.color = Colors.amber,
      this.elevation = 3,
      this.textColor = Colors.white})
      : super(key: key);

  final String title;
  final Function onPress;
  final Color color;
  final double elevation;
  final Color textColor;

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
            return elevation;
          }
          return elevation;
        },
      ), backgroundColor: MaterialStateProperty.resolveWith((states) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
        };
        if (states.any(interactiveStates.contains)) {
          return Colors.amber.shade600;
        }
        return color;
      })),
      onPressed: () {
        onPress();
      },
      child: Text(
        title,
        style: GoogleFonts.rubik(
            fontSize: 15, color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
