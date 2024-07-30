import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/product_Gridview.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridPage(),
    );
  }
}
