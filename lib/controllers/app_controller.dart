import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeController extends GetxController {
  final int itemCount = 10;
  final double itemHeight = 100;
  final double itemWidth = 100;
  final double itemHorizontalMargin = 10;
  final double circleRadius = 250;
  final ScrollController mainScrollController = ScrollController();
  final ScrollController itemScrollController = ScrollController();
  
  double angle = 0;
  int selectedIndex = -1;
  String errorMessage = '';
  int? enteredIndex;

  void onInit() {
    init();
    super.onInit();
  }

  void setEnteredIndex(String? value) {
    if (value == null || value == '' || value =='-') {
      enteredIndex = null;
    }else{
      enteredIndex = int.parse(value);
    }
  }

  void setIndexByEnter() {
    if (validate(enteredIndex) == false) {
      Get.snackbar('Error', errorMessage, colorText: Colors.red);
      return;
    }
    selectedIndex = enteredIndex!;
    final scrollValue = selectedIndex * (itemWidth + itemHorizontalMargin);
    Get.back();
    itemScrollController.jumpTo(scrollValue);
    //update();
  }

  void setIndexBySelect(int index) {
    selectedIndex = index;
    enteredIndex = index;
    Get.toNamed('/second');
    //update();
  }

  bool validate(int? index) {
    if (index == null) {
      errorMessage = 'Need enter the value';
      return false;
    }
    if (index < 0) {
      errorMessage = 'The enter value must be greater than or equal zero';
      return false;
    }
    if (index > itemCount - 1) {
      errorMessage = 'The enter value must be less than or equal ${itemCount - 1}';
      return false;
    }
    return true;
  }

  Future<void> init() async {
    mainScrollController.addListener(() {
      angle = _calcAngle();
      if (mainScrollController.position.pixels ==
          mainScrollController.position.maxScrollExtent) {
        Get.snackbar('Stop', 'You have reached the top of the screen!',
            duration: Duration(seconds: 2));
      }
      update();
    });
  }

  double _calcAngle() {
    final normLength = 0.02 * mainScrollController.position.pixels;
    return -(normLength * 180) / (circleRadius * pi);
  }
}