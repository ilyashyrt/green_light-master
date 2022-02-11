import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title buraya gelecek'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [Text('dashboard statiscs gelecek')],
      )),
    );
  }
}
