import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';

class AnimationText extends StatelessWidget {
  final TextStyle textStyle;
  final List<AnimatedText> listtext;
  final bool? isrebat;
  final bool? stopPauseOnTap;
  const AnimationText(
      {super.key,
      required this.textStyle,
      required this.listtext,
      this.isrebat,
      this.stopPauseOnTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.height(context) * 0.08,
      child: DefaultTextStyle(
        style: textStyle,
        child: AnimatedTextKit(
          
          animatedTexts: listtext,
          isRepeatingAnimation: isrebat ?? false,
          stopPauseOnTap: stopPauseOnTap ?? false,
        ),
      ),
    );
  }
}
