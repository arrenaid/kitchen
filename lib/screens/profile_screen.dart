import 'package:flutter/material.dart';

import '../constans.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String route = "ProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: const SafeArea(
        child: Center(
          child: Text(
            'ProfileScreen',
            style: tsHeadline1,
          ),
        ),
      ),
    );
  }
}
