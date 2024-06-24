import 'package:flutter/material.dart';
class MyColor {
  static Color mydarkblue =
      Color(int.parse(("#014268").substring(1), radix: 16) + 0xFF000000);
  static Color myblack =
      Color(int.parse(("#242526").substring(1), radix: 16) + 0xFF000000);
  static Color myLightgrey =
      Color(int.parse(("#97b5c6").substring(1), radix: 16) + 0xFF000000);
  static Color mylightblue =
      Color(int.parse(("#3975c4").substring(1), radix: 16) + 0xFF000000);
}

class MyDecoration {
  static BoxDecoration ContainerDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColor.myLightgrey, width: 1.5));
  }
}
