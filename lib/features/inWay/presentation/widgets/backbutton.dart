import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';

class MYBackButton extends StatelessWidget {
  final Color circleColor;
  final Color iconColor;
  const MYBackButton(
      {super.key, required this.circleColor, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSizes.height(context) * 0.04,
          right: AppSizes.width(context) * 0.4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: CircleAvatar(
          backgroundColor: circleColor,
          radius: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.arrow_back_ios,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
