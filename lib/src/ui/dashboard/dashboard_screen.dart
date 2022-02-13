import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:greenlife/src/providers/firebase_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late FirebaseProvider firebaseProvider;
  @override
  void initState() {
    super.initState();
    firebaseProvider = context.read<FirebaseProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: firebaseProvider.getStreamMessage(),
            builder: (context, AsyncSnapshot snapshot) {
              return Text(snapshot.data['isim']);
            },
          ),
          Center(child: Text('dashboard safası'))
        ],
      ),
    );
  }
}
