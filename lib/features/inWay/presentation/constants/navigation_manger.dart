import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/animaiton_routes_manger.dart';

void slideRightNaviget(Widget page, context) {
  Navigator.of(context).push(SlideRight(page: page));
}

void slideLeftNaviget(Widget page, context) {
  Navigator.of(context).push(SlideLeft(page: page));
}
void navigatioonalign(Widget page, context) {
  Navigator.of(context).push(AligmentRoute(page: page));
}

void naviegtpush(Widget page, context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}

void navigetandfinsih(Widget page, context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (Route<dynamic> route) => false);
}
