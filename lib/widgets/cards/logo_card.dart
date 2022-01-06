import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key,
      required this.logoTitleSize,
      required this.logoSubtitleSize,
      required this.logoCardSize,
      required this.logoCardMargin,
      required this.cardBorderRadius})
      : super(key: key);

  final double logoTitleSize;
  final double logoSubtitleSize;
  final double logoCardSize;
  final EdgeInsets logoCardMargin;
  final double cardBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   width: logoCardSize,
        //   height: logoCardSize,
        //   margin: logoCardMargin,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(logoCardSize)),
        //     // boxShadow: <BoxShadow>[
        //     //   BoxShadow(
        //     //       color: Theme.of(context).shadowColor,
        //     //       offset: const Offset(
        //     //         .5,
        //     //         .5,
        //     //       ),
        //     //       blurRadius: 1.0)
        //     // ]
        //   ),
        //   child: ClipRRect(
        //       borderRadius: BorderRadius.all(Radius.circular(logoCardSize)),
        //       child: Image.asset('assets/images/logo.png')),
        // ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(logoCardSize))),
          elevation: 5,
          child: Image.asset(
            'assets/images/logo.png',
            width: logoCardSize,
            height: logoCardSize,
          ),
        ),

        // CircleAvatar(
        //   backgroundColor: Colors.transparent,
        //   radius: logoCardSize / 2,
        //   child: Image.asset('assets/images/logo.png'),
        // ),
        Text(
          'STOLIK',
          style: GoogleFonts.rubik(
              fontSize: logoTitleSize,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        Text(
          'versja 1.0.0',
          style: GoogleFonts.rubik(
              fontSize: logoSubtitleSize,
              color: Colors.black,
              fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}

class SmallLogo extends StatelessWidget {
  const SmallLogo({Key? key, this.radius = 45}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius / 2))),
      elevation: 3,
      child: Image.asset(
        'assets/images/logo.png',
        width: radius,
        height: radius,
      ),
    );
    //   Container(
    //   width: radius,
    //   height: radius,
    //   margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(radius / 2)),
    //     // boxShadow: <BoxShadow>[
    //     //   BoxShadow(
    //     //       color: Theme.of(context).shadowColor,
    //     //       offset: const Offset(
    //     //         .5,
    //     //         .5,
    //     //       ),
    //     //       blurRadius: 1.0)
    //     // ]
    //   ),
    //   child: ClipRRect(
    //       borderRadius: BorderRadius.all(Radius.circular(21)),
    //       child: Image.asset('assets/images/logo.png')),
    // );
  }
}
