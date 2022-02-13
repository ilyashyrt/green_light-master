import 'package:flutter/material.dart';

class AddFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arkadaş Ekleme sayfası'),
      ),
      body: Column(
        children: [
          Text("Arkadaş eklemek için butona basınız"),
          ElevatedButton(
              onPressed: () {
                print('pressed');
              },
              child: Text("Arkadaş Ekle"))
        ],
      ),
    );
  }
}
