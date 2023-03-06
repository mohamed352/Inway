import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/my_model_sheeet_home.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.black,
      Colors.white,
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const FaIcon(
                  FontAwesomeIcons.magnifyingGlassLocation,
                  size: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Where to?',
                        textStyle: MyTextStyle.meduimBold,
                        colors: colorizeColors,
                      ),
                    ],
                  ),
                ),
                MyDivider(isHight: true,
                 inch: AppSizes.getHight(context, 40),color: Colors.grey.shade400),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              modelsheetforHome(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.solidClock,
                    color: Colors.black,
                    size: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Now',
                        style: MyTextStyle.meduimBold,
                      )),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
