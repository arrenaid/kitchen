import 'package:flutter/material.dart';

import '../constans.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);
  static const String route = "BasketScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'BasketScreen',
            style: tsHeadline1,
          ),
        ),
      ),
    );
  }
}
