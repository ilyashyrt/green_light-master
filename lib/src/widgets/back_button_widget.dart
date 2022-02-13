import 'package:flutter/material.dart';
import 'package:greenlife/src/constants/colors.dart';
import 'package:greenlife/src/constants/padding.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.registerLeftTopPadding,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            splashColor: AppColors.appThemeGreenColor,
            alignment: Alignment.centerRight,
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.iconButtonIconColor,
          )),
    );
  }
}
