import 'package:flutter/material.dart';

Text forText(
    {required String title, double fontSize = 15, Color color = Colors.black}) {
  return Text(title, style: TextStyle(fontSize: fontSize, color: color));
}
