import 'package:flutter/material.dart';
import 'package:greenlife/src/constants/colors.dart';
import 'package:greenlife/src/constants/padding.dart';
import 'package:greenlife/src/constants/strings.dart';
import 'package:greenlife/src/ui/video/video_screen.dart';
import 'package:greenlife/src/utils/device/device_utils.dart';
import 'package:greenlife/src/widgets/back_button_widget.dart';
import 'package:greenlife/src/widgets/custom_textformfield_widget.dart';
import 'package:greenlife/src/widgets/elevated_button_widget.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appThemeGreenColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(),
            Center(
              child: Text(
                Strings.welcomeBackText,
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: DeviceUtils.getScaledWidth(context, 1),
              height: DeviceUtils.getScaledHeight(context, 0.5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(flex: 2,),
                  CustomTextFormField(icon: Icons.mail,hintText: Strings.emailOrUsernameText,textEditingController: emailController,),
                  Spacer(flex: 1,),
                  CustomTextFormField(icon: Icons.lock,hintText: Strings.passwordText,textEditingController: passwordController,),
                  Spacer(flex: 9,),
                  ElevatedButtonWidget(text: Strings.loginText, color: AppColors.appThemeGreenColor, width: DeviceUtils.getScaledWidth(context, 0.8), height: 50, onPressed: (){
                  }),
                  Spacer(flex: 2,),
                  Text(Strings.signUpText,style: TextStyle(color: AppColors.loginSignUpText),),
                  Spacer(flex: 2,)
                ]),
            ),
          ]),
    );
  }
}
