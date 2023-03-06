import 'package:flutter/material.dart';

void showMySnackBar(
    {required BuildContext context, required String content, bool? isError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      content,
      style: const TextStyle(fontSize: 15),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    padding: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: isError == true ? Colors.red : Colors.grey.shade800,
    behavior: SnackBarBehavior.floating,
  ));
}
