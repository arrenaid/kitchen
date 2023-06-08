import 'package:flutter/material.dart';
import 'package:kitchen/screens/basket_screen.dart';
import 'package:kitchen/screens/main_screen.dart';
import 'package:kitchen/screens/navi_screen.dart';
import 'package:kitchen/screens/profile_screen.dart';
import 'package:kitchen/screens/search_screen.dart';

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
        SearchScreen.route: (context) => const SearchScreen(),
        BasketScreen.route: (context) => const BasketScreen(),
        ProfileScreen.route: (context) => const ProfileScreen(),
        NaviScreen.route: (context) => const NaviScreen(),

      },
      initialRoute: NaviScreen.route,
    );
  }
}
