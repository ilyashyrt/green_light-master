import 'package:flutter/material.dart';

import 'package:greenlife/src/constants/colors.dart';
import 'package:greenlife/src/constants/padding.dart';
import 'package:greenlife/src/utils/device/device_utils.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? textEditingController;
  IconData icon;
  String? hintText;
  CustomTextFormField({
    Key? key,
    this.textEditingController,
    required this.icon,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.customTextFieldBottomPadding,
      child: Container(
        width: DeviceUtils.getScaledWidth(context, 0.8),
                    decoration: BoxDecoration(
                        color: AppColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
                        controller: textEditingController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lütfen bu alanı doldurunuz';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(color: AppColors.textFieldTextColor),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          prefixIcon: Padding(
                            padding: Paddings.textFieldIconPadding,
                            child: Icon(
                              icon,
                              color: AppColors.appThemeGreenColor,
                            ),
                          ),
                          //hintText: LocaleKeys.register_name.tr(),
                          //hintStyle: context.textTheme.bodyText2!
                          // .copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
      ),
    );
  }
}
