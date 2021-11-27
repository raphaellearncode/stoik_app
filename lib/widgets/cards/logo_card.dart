import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card(
        //   margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        //   elevation: 5,
        //   color: Colors.transparent,
        //   shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(
        //     Radius.circular(15),
        //   )),
        //   child:
        // ),
        Container(
          width: 220,
          height: 220,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(110)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(
                      1.0,
                      2.0,
                    ),
                    blurRadius: 3.0)
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.asset('assets/images/logo.png')),
        ),
        Text(
          'STOLIK',
          style: GoogleFonts.rubik(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
