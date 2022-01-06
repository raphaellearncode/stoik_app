import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.assetPath,
      this.fontSize = 16})
      : super(key: key);

  final String title;
  final String assetPath;
  final Function onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: SizedBox(
                  height: 30,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2.0),
                      color: Colors.white.withOpacity(0.5),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: fontSize),
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
