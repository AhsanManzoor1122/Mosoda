import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';
import 'package:mosoda/View/Authorization/SignupByEmail.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const SignUpEmailScreen(),
    const SignUpEmailScreen(),
    const SignUpEmailScreen(),
  ];

  void onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  // Show exit confirmation dialog when the user presses the back button
  Future<bool> _onWillPop() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Exit'),
        content: const Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: screens[_selectedIndex], // Display the selected screen
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.backgroundColor,
          fixedColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onItemTap,
        ),
      ),
    );
  }
}
