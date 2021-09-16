import 'package:flutter/material.dart';

abstract class TextFieldStyles {
  static InputDecoration textMaterialStyle(
          {IconData? iconData,
          void Function()? togglePassword,
          bool? showPassword,
          String? labelText,
          String? errorText}) =>
      InputDecoration(
          suffixIcon: iconData == null
              ? null
              : IconButton(
                  onPressed: togglePassword!,
                  icon: Icon(
                    !(showPassword!) ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
          labelText: labelText,
          errorText: errorText,
          labelStyle: TextStyle(
              fontSize: 14,
              color: errorText == null ? Colors.grey.shade400 : Colors.red),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent)));
}
