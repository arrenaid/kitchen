import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String route = "MainScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'MainScreen',
          ),
        ),
      ),
    );
  }
}
