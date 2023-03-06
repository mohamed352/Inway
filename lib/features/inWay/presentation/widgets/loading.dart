import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';

class LoadingAnimation extends StatelessWidget {
  final Widget widget;
  final bool conditionToLoading;
  const LoadingAnimation({
    super.key,
    required this.widget,
   required this.conditionToLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        widget,
        if(conditionToLoading)
        Container(
            height: AppSizes.height(context),
            width: AppSizes.width(context),
            color: ColorApp.lightblue.withOpacity(0.1),
            child: const Center(child: CircularProgressIndicator())),
      ],
    );
  }
}
