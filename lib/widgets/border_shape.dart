import 'package:flutter/widgets.dart';

class BorderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.4993759, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.9995212);
    path.lineTo(size.width * 0.9987517, size.height * 0.9995212);
    path.lineTo(size.width * 0.9987517, size.height * 0.7808757);
    path.lineTo(size.width * 0.9247695, size.height * 0.7808757);
    path.lineTo(size.width * 0.9247695, size.height * 0.9578741);
    path.lineTo(size.width * 0.07398217, size.height * 0.9578741);
    path.lineTo(size.width * 0.07398217, size.height * 0.04164247);
    path.lineTo(size.width * 0.4993759, size.height * 0.04164247);
    path.lineTo(size.width * 0.4993759, size.height * -0.000004633205);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
