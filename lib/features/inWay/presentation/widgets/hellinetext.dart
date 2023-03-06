import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';

class HeadLineText extends StatelessWidget {
  final String bigtext;
  final String smaltext;
  const HeadLineText(
      {super.key, required this.bigtext, required this.smaltext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSizes.width(context) * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                bigtext,
                style: MyTextStyle.styleBold,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              smaltext,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
