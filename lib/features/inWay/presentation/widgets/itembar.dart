import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'divider.dart';

class ItemBar extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function function;
  final bool? showIcon;
  final bool? showDivider;

  final String? smallText;
  const ItemBar(
      {super.key,
      required this.iconData,
      required this.text,
      required this.function,
      this.showIcon,
      this.smallText,
      this.showDivider});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(iconData),
                SizedBox(
                  width: AppSizes.getWidth(context, 20),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: MyTextStyle.meduimBold,
                      ),
                      if (smallText != '' && smallText != null)
                        Text(
                          '$smallText',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        )
                    ],
                  ),
                ),
                // const Spacer(),
                if (showIcon != null)
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  )
              ],
            ),
          ),
          if (showDivider != null)
            MyDivider(
              inch: 1,
              color: Colors.grey.shade300,
              isHight: false,
              marginTop: 20,
            )
        ],
      ),
    );
  }
}
