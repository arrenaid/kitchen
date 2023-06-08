import 'package:flutter/material.dart';
import 'package:kitchen/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MainScreen.route: (context) => const MainScreen(),
      },
      initialRoute: MainScreen.route,
    );
  }
}
