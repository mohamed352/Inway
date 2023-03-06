import 'package:flutter/material.dart';

class MyElvatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textcolor;
  final Function onPressed;
  final Size size;
  const MyElvatedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      this.textcolor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: size,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20)) //BorderRadius.circular(0)
              )),
      child: Text(
        text,
        style: TextStyle(fontSize: 17, color: textcolor ?? Colors.white),
      ),
    );
  }
}

class MyElvatedButtonIcon extends StatelessWidget {
  final String text;
  final Color color;
  final Color criclecolor;
  final double radius;
  final double? paddingRight;
  final Color? textcolor;
  final Color? forgrandcolor;
  final Function onPressed;
  final Size size;
  final Widget icon;
  const MyElvatedButtonIcon(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      this.textcolor,
      required this.size,
      required this.icon,
      required this.criclecolor,
      required this.radius,
      this.paddingRight,
      this.forgrandcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: size,
          foregroundColor: forgrandcolor??Colors.white,
          elevation: 0,

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10)) //BorderRadius.circular(0)
              )),
      icon: Padding(
        padding: EdgeInsets.only(right: paddingRight ?? 0),
        child: CircleAvatar(
          backgroundColor: criclecolor,
          radius: radius,
          child: icon,
        ),
      ),
      label: Text(
        text,
        style: TextStyle(fontSize: 17, color: textcolor ?? Colors.white),
      ),
    );
  }
}
