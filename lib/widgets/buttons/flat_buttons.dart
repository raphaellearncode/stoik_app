import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatBtn extends StatelessWidget {
  const FlatBtn({Key? key, required this.title, required this.onPress})
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
          return Colors.amber.shade600;
        }
        return Colors.amber.shade400;
      })),
      onPressed: () {
        onPress();
      },
      child: Text(
        title,
        style: GoogleFonts.rubik(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
