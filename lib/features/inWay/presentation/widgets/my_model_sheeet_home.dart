import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';

dynamic modelsheetforHome(context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: AppSizes.getHight(context, 410),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemForSheet(text: 'Schedule a Ride', onTap: () {}),
              ItemForSheet(text: 'Tue,Feb28', onTap: () {}),
              ItemForSheet(text: '10:45 PM -10:55 PM', onTap: () {}),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getHight(context, 30)),
                child: MyElvatedButton(
                  text: 'Set pickup time',
                  color: Colors.black,
                  textcolor: Colors.white,
                  onPressed: () {},
                  size: AppSizes.fullsize(context),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

class ItemForSheet extends StatelessWidget {
  final String text;
  final Function onTap;
  const ItemForSheet({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.getHight(context, 20)),
        child: Column(
          children: [
            Text(
              text,
              style: MyTextStyle.modelbottomsheet,
            ),
            SizedBox(
              height: AppSizes.getHight(context, 20),
            ),
            MyDivider(
              inch: 2,
              isHight: false,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
