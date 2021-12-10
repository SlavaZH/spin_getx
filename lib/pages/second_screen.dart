import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_getx/controllers/app_controller.dart';
import 'package:spin_getx/widgets/custom_textfield.dart';
import 'package:spin_getx/widgets/save_button.dart';

class SecondScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextfield(
              onChangeHandler: controller.setEnteredIndex, 
              initValue: controller.selectedIndex.toString()
            ),
            SizedBox(height: 20,),
            SaveButton(
              onSaveHandler: controller.setIndexByEnter,
              color: Colors.blue,
            )
          ],
        ),
      )
    );
  }
}