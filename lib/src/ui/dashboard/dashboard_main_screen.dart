import 'package:flutter/material.dart';
import 'package:quiddy/src/ui/dashboard/dashboard_screen.dart';
import 'package:quiddy/src/ui/login/login_screen.dart';
import 'package:quiddy/src/ui/register/register_screen.dart';

class DashboardMainScreen extends StatefulWidget {
  @override
  _DashboardMainScreenState createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  int? selectedPage = 0;
  final _pageOptions = [
    DashboardScreen(),
    RegisterScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage!],
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage!,
          backgroundColor: Colors.pink,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          ],
        ),
      ),
    );
  }
}
