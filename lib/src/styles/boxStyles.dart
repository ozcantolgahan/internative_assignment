import 'package:flutter/material.dart';
import 'package:internative_assignment/src/styles/appColors.dart';

abstract class BoxStyles {
  static BorderRadius get cupertinoButtonRadius => BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10));
}
