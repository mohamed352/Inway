import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/widgets/backbutton.dart';

class RegisterSplach extends StatelessWidget {
  final Widget animationtext1;
  final Widget? animationtext2;

  const RegisterSplach(
      {super.key, required this.animationtext1, this.animationtext2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.height(context) * 0.35,
      width: AppSizes.width(context),
      child: Container(
        color: ColorApp.lightblue,
        padding: EdgeInsets.only(
          left: 4,
          right: AppSizes.width(context) * 0.4,
        ),
        child: Column(
          children: [
            MYBackButton(
                circleColor: Colors.white, iconColor: ColorApp.lightblue),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.height(context) * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [animationtext1, animationtext2 ?? const SizedBox()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
