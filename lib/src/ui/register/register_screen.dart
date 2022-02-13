import 'package:flutter/material.dart';
import 'package:greenlife/src/constants/colors.dart';
import 'package:greenlife/src/constants/padding.dart';
import 'package:greenlife/src/constants/strings.dart';
import 'package:greenlife/src/ui/login/login_screen.dart';
import 'package:greenlife/src/utils/device/device_utils.dart';
import 'package:greenlife/src/widgets/back_button_widget.dart';
import 'package:greenlife/src/widgets/custom_textformfield_widget.dart';
import 'package:greenlife/src/widgets/elevated_button_widget.dart';
import 'package:greenlife/src/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appThemeGreenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(),
          Padding(
            padding: Paddings.registerLeftPadding,
            child: Text(
              Strings.registerToContinueText,
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: DeviceUtils.getScaledWidth(context, 1),
            height: DeviceUtils.getScaledHeight(context, 0.6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CustomTextFormField(
                          icon: Icons.person,
                          hintText: Strings.nameText,
                          textEditingController: nameController,
                        ),
                        CustomTextFormField(
                          icon: Icons.email,
                          hintText: Strings.emailOrPhoneText,
                          textEditingController: emailController,
                        ),
                        CustomTextFormField(
                          icon: Icons.location_on,
                          hintText: Strings.dateOfBirthText,
                          textEditingController: dateOfBirthController,
                        ),
                        CustomTextFormField(
                          icon: Icons.lock,
                          hintText: Strings.passwordText,
                          textEditingController: passwordController,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: Paddings.registerAgreementLeftPadding,
                              child: Checkbox(
                                checkColor: AppColors.appThemeGreenColor,
                                activeColor: AppColors.textFieldBackgroundColor,
                                side: BorderSide(
                                    style: BorderStyle.solid,
                                    color: AppColors.appThemeGreenColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              Strings.agreementText,
                              style: TextStyle(
                                  color: AppColors.registerAgreementTextColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        ElevatedButtonWidget(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginScreen())));

                            },
                            text: Strings.registerText,
                            color: AppColors.appThemeGreenColor,
                            width: DeviceUtils.getScaledWidth(context, 0.8),
                            height: 50),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}





//!Navigator.pushNamed(context, Strings.dashboard)