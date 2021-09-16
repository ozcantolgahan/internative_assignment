import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/src/styles/appColors.dart';
import 'dart:io';

import 'package:internative_assignment/src/styles/boxStyles.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  AppButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoButton(
        child: Text(text!),
        onPressed: onPressed!,
        borderRadius: BoxStyles.cupertinoButtonRadius,
        color: AppColors.purple,
      );
    return ElevatedButton(
      onPressed: onPressed!,
      child: Text(text!),
    );
  }
}
