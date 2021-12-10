import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_getx/controllers/app_controller.dart';

import 'package:spin_getx/widgets/circle.dart';
import 'package:spin_getx/widgets/content_container.dart';
import 'package:spin_getx/widgets/horizontal_list.dart';
import 'package:spin_getx/widgets/sceleton.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(
          builder: (_) => Stack(children: [
            Circle(angle: controller.angle, radius: controller.circleRadius),
            SingleChildScrollView(
              controller: controller.mainScrollController,
              child: Column(children: [
                SizedBox(height: screenHeight * 0.45),
                ContentContainer(
                  height: screenHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Sceleton(width: 300),
                      const SizedBox(height:25),
                      const Sceleton(width: 350),   
                      const SizedBox(height:25),
                      const Sceleton(width: 200),          
                      const SizedBox(height:55),           
                      HorizontalList(
                        itemCount: controller.itemCount, 
                        selectedIndex: controller.selectedIndex, 
                        scrollController: controller.itemScrollController,
                        onTapHandler: controller.setIndexBySelect,
                        heigth: controller.itemHeight,
                        itemWidth: controller.itemWidth,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        )
    );
  }
}
