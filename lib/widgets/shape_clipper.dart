import 'package:flutter/material.dart';

import 'border_shape.dart';

class ShapeClipper extends StatelessWidget {
  const ShapeClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AspectRatio(
        aspectRatio: 4.5 / 8,
        child: ClipPath(
          clipper: BorderShape(),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 500),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(0.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  stops: const [0.0, 0.5, 1.0],
                  colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade700,
                    Colors.blue.shade900,
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
