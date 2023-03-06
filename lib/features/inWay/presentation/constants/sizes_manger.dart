import 'package:flutter/material.dart';

class AppSizes {
  static dynamic height(context) {
    return MediaQuery.of(context).size.height;
  }

  static dynamic width(context) {
    return MediaQuery.of(context).size.width;
  }

  static dynamic meduimsize(context) {
    return Size(width(context) * 0.5, height(context) * 0.07);
  }

  static dynamic fullsize(context) {
    return Size(width(context), height(context) * 0.075);
  }

  static dynamic getHight(context, hight) {
    final double customhight = hight / 760;
    return height(context) * customhight;
  }

  static dynamic getWidth(context, wiedth) {
    final double customwidth = wiedth / 360;
    return width(context) * customwidth;
  }
}
