import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';


class ItemForImage extends StatelessWidget {
  final String text;
  final String image;

  const ItemForImage({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.getWidth(context, 164),
      height: AppSizes.getHight(context, 125),
      margin: EdgeInsets.symmetric(vertical: AppSizes.getHight(context, 30)),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.getWidth(
                    context,
                    85,
                  ),
                ),
                child: Image.asset(
                  image,
                )),
            const Spacer(),
            Text(
              text,
              style: MyTextStyle.meduimBold,
            )
          ],
        ),
      ),
    );
  }
}