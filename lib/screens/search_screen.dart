import 'package:flutter/material.dart';

import '../constans.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String route = "SearchScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[200],
      body: const SafeArea(
        child: Center(
          child: Text(
            'SearchScreen',
            style: tsHeadline1,
          ),
        ),
      ),
    );
  }
}
