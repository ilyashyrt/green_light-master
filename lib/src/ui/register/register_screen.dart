import 'package:flutter/material.dart';
import 'package:quiddy/src/constants/strings.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('sayfa yönlendirmesi için örnek buton'),
        Center(
          child: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Strings.dashboard)),
        ),
      ]),
    );
  }
}
