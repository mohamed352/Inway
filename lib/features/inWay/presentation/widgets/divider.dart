import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';

class MyDivider extends StatelessWidget {
  final double inch;
  final Color color;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginDawon;
  final bool isHight;

  const MyDivider({
    super.key,
    required this.inch,
    this.marginDawon,
    this.marginLeft,
    this.marginRight,
    this.marginTop,
  required  this.color,
    required this.isHight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: marginLeft ?? 0,
          bottom: marginDawon ?? 0,
          right: marginRight ?? 0,
          top: marginTop ?? 0),
      color: color,
      width: isHight ? 1 : AppSizes.width(context),
      height: inch,
    );
  }
}
