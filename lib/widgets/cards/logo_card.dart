import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          elevation: 5,
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
          child: Image.asset('assets/images/logo.png'),
        ),
        Text(
          'Nazwa apki',
          style: GoogleFonts.rubik(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
