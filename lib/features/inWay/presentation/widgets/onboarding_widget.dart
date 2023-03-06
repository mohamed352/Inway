import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/pages/OnBoarding/onboarding_model.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.obcolor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LottieBuilder.asset(model.image, height: model.hight * 0.4),
            Column(
              children: [
                Text(
                  model.textbold,
                  textAlign: TextAlign.start,
                  style: MyTextStyle.meduimBold,
                ),
                Text(
                  model.text,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
