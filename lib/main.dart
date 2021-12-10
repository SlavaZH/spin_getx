import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_getx/pages/second_screen.dart';
import 'package:flutter/rendering.dart';
import 'controllers/app_controller.dart';
import 'pages/home_page.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/', 
          page: () => HomePage(),
          binding: AppBind(),
        ),
        GetPage(
          name: '/second', 
          page: () => SecondScreen()
        )
      ],
    );
  }
}
