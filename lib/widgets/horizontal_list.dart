import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    required this.itemCount,
    required this.onTapHandler,
    required this.scrollController,
    this.selectedIndex = -1,
    this.heigth = 100,
    this.itemWidth = 100,
    this.horizontalMargin = 10,
    Key? key
  }) : super(key: key);

  final double heigth;
  final double itemWidth;
  final int itemCount;
  final int selectedIndex;
  final double horizontalMargin;
  final ScrollController scrollController;
  final void Function(int index) onTapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          controller: scrollController,
          itemBuilder: (context, index) => _buildItem(index)),
    );
  }

  Widget _buildItem(int index) {
    bool isSelected = index == selectedIndex ? true : false;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(width: 10),
      GestureDetector(
        onTap: () => onTapHandler(index),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected == true ? Colors.blue : Colors.white,
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: itemWidth,
          height: heigth,
        ),
      ),
      SizedBox(width: 10)
    ]);
  }
}
