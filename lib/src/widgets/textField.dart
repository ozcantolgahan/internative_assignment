import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/src/styles/appColors.dart';
import 'package:internative_assignment/src/styles/textFieldStyles.dart';
import 'dart:io';

import 'package:internative_assignment/src/styles/textStyles.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final void Function()? togglePassword;
  final IconData? iconData;
  final bool? showPassword;

  AppTextField(
      {this.labelText,
      this.errorText,
      this.keyboardType,
      this.obscureText = false,
      this.onChanged,
      this.togglePassword,
      this.iconData = null,
      this.showPassword = false});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoTextField(
        onChanged: onChanged,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        placeholder: labelText,
        placeholderStyle: TextStyles.cupertinoFieldTextStyle(
            errorText == null ? Colors.grey.shade400 : Colors.red),
        suffix: iconData == null
            ? null
            : IconButton(
                onPressed: togglePassword!,
                icon: Icon(
                  !(showPassword!) ? Icons.visibility : Icons.visibility_off,
                ),
              ),
      );
    else
      return TextField(
        obscureText: obscureText!,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: TextFieldStyles.textMaterialStyle(
            labelText: labelText,
            errorText: errorText,
            iconData: iconData,
            showPassword: showPassword,
            togglePassword: togglePassword),
      );
  }
}
