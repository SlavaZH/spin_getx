import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Circle extends StatelessWidget {
  const Circle({
    required this.angle, 
    required this.radius, 
    Key? key
  }) : super(key: key);

  final double angle;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -radius,
        left: -radius,
        child: Transform.rotate(
          angle: angle,
          child: SvgPicture.asset(
            'assets/circle.svg', 
            width: radius * 2
          ),
      )
    );
  }
}
