import 'package:flutter/material.dart';
import 'package:quiddy/src/constants/colors.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  const BottomNavigatorBarWidget(
      {Key? key, required this.selectedIndex, this.onItemTapped})
      : super(key: key);

  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;

  @override
  _BottomNavigatorBarWidgetState createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits),
          label: 'Ürünlerim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments),
          label: 'Satışlarım',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_drop_up),
          label: 'İşlemler',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColors.orange[900],
      onTap: widget.onItemTapped,
    );
  }
}
