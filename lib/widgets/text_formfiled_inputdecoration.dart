

import 'package:flutter/material.dart';

import '../const_file/app_all_color.dart';



InputDecoration textFormfiledInputeDecoration(String text, {Widget? prefixIcon}) {
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(color: Colors.black),
    filled: true,
    fillColor: AppColor.appPrimaryColor,
    border: InputBorder.none,
    prefixIcon: prefixIcon,
  );
}
