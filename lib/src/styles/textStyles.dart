import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get title =>
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

  static TextStyle get subTitle =>
      TextStyle(fontSize: 20, color: Colors.grey.shade400);

  static TextStyle get smallText =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  static TextStyle cupertinoFieldTextStyle(Color color) =>
      TextStyle(color: color);
}
