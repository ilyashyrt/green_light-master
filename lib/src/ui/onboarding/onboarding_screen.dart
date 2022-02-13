import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:greenlife/src/constants/strings.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title buraya gelecek'),
      ),
      body: IntroductionScreen(
        pages: [
          // First Page
          buildPageViewModel(
              title: titleWidget(
                'First PAge',
                'first page',
              ),
              // iamge must be added
              image: 'image comes here!'),

          // Second Page
          buildPageViewModel(
              title: titleWidget('Second Page', "Second Page"),
              // iamge must be added
              image: 'image comes here!'),
          // Third Page
          buildPageViewModel(
              title: titleWidget('Third Page', "Third Page"),
              // iamge must be added
              image: 'image comes here!'),
        ],

        done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text(
          'Bitir',
          style: TextStyle(color: Color.fromRGBO(0, 102, 255, 1), fontSize: 14),
        ),
        onSkip: () => goToHome(context),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.amber,
        skipFlex: 0,
        nextFlex: 0,
        // isProgressTap: false,
        // isProgress: false,
        showDoneButton: false,
        showNextButton: false,
      ),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  // Page General design
  PageViewModel buildPageViewModel(
      {required Widget title, required String image}) {
    return PageViewModel(
      titleWidget: title,
      image: buildImage(image),
      decoration: getPageDecoration(),
      body: '',
    );
  }

  Widget buildImage(String path) => Center(
          child: Image.asset(
        path,
      ));

  Widget titleWidget(String title, String text) => Container(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 40, 1),
                fontSize: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color.fromRGBO(40, 40, 40, 0.64)),
              ),
            ),
          ],
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 21,
        ),
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(40, 40, 48, 0.64),
          height: 1.5,
        ),
        imageAlignment: Alignment.center,
        descriptionPadding: EdgeInsets.all(20).copyWith(bottom: 0),
        pageColor: Colors.white,
      );

  void goToHome(context) => Navigator.pushNamed(context, Strings.dashboard);
}
