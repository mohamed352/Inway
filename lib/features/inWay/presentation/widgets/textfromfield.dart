import 'package:flutter/material.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';

class MyTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? perfixicon;
  final TextInputType textInputType;
  final Widget? suifxicon;
  final String? lapletext;
  final Color? color;
  final Function? ontapsuffixicon;
  final Function? validate;
  final Function? onChange;
  final bool? obscuretext;
  final String? hinttext;
  final TextStyle? hintstyle;
  const MyTextFromField({
    super.key,
    required this.controller,
    this.perfixicon,
    required this.textInputType,
    this.suifxicon,
    this.lapletext,
    this.obscuretext,
    this.color,
    this.ontapsuffixicon,
    this.validate,
    this.hinttext,
    this.hintstyle,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      validator: (value) {
        return validate != null ? validate!(value) : null;
      },
      obscureText: obscuretext ?? false,
      decoration: InputDecoration(
        prefixIcon: perfixicon,
        filled: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIconColor: ColorApp.lightblue,
        suffixIcon: suifxicon != null
            ? IconButton(
                onPressed: () {
                  ontapsuffixicon!();
                },
                icon: suifxicon!)
            : null,
        fillColor: color,
        labelText: lapletext,
        hintStyle: hintstyle,
        hintText: hinttext,
      ),
    );
  }
}

vildate(value, name) {
  if (value.isEmpty) {
    return '$name Must Not Empty';
  }
}

vildateemail(value) {
  if (value.isEmpty) {
    return 'Email Must Not Empty';
  }
  String pattern = r'\w+@\w+\.\w+';
  if (!RegExp(pattern).hasMatch(value)) {
    return 'Invalid E-mail Address format.';
  }
  return null;
}
