import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class SentenceCard extends StatelessWidget {
  const SentenceCard(
      {Key? key,
      required this.description,
      required this.imgAssets,
      required this.author})
      : super(key: key);

  final String imgAssets;
  final String description;
  final String author;

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: Tween<double>(begin: 0.7, end: 1.0),
        duration: const Duration(milliseconds: 300),
        delay: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        builder: (context, child, value) {
          return Transform.scale(
            scale: value,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imgAssets,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyText1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(author,
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
