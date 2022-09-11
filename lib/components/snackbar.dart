import 'package:flutter/material.dart';

snackBar(
  BuildContext context,
  String mainText,
  Color backgroundColor,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mainText),
    backgroundColor: backgroundColor,
  ));
}
  