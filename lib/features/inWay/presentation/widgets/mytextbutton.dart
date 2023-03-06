import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final Function ontap;
  final double paddinghorizontal;
  final double paddingvertical;
  final TextStyle? textStyle;
  const MyTextButton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.paddinghorizontal,
      required this.paddingvertical,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddinghorizontal,
          vertical: paddingvertical,
        ),
        child: Text(text, style:textStyle?? MyTextStyle.textbutton),
      ),
    );
  }
}
