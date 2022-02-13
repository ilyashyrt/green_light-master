import 'package:flutter/material.dart';

import 'package:quiddy/src/constants/colors.dart';
import 'package:quiddy/src/utils/device/device_utils.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String text;
  Color color;
  double width;
  double height;
  Function() onPressed;
  ElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          primary: color),
    );
  }
}
