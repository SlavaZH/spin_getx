import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContentContainer extends StatelessWidget {
  ContentContainer({
    required this.child, 
    required this.height,
    Key? key
  }) : super(key: key);

  Widget child;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: EdgeInsets.only(top: 30, left: 20),
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20)
             )
            ),
        child: child
    );
  }
}
