import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/edu.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  icon,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2.0),
                      width: 200,
                      //color: Colors.grey.withOpacity(0),
                      child: Text(
                        title,
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
