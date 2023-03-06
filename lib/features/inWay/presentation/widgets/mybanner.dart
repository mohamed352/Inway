import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';

class MyBanner extends StatelessWidget {
  final IconData icon;
  final String headText;
  final String smallText;
  const MyBanner(
      {super.key,
      required this.headText,
      required this.icon,
      required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headText,
                style: MyTextStyle.meduimBold.copyWith(fontSize: 15),
              ),
              Text(
                smallText,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        )
      ],
    );
  }
}
