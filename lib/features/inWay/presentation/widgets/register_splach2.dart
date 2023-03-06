import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';

class RegisterSplach2 extends StatelessWidget {
  final Widget widget;
  const RegisterSplach2({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.height(context) * 0.65,
        width: AppSizes.width(context),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            padding: EdgeInsets.only(top: AppSizes.height(context) * 0.035),
            child: Padding(padding: const EdgeInsets.all(15), child: widget)));
  }
}
