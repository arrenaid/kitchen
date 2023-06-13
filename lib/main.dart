import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen/bloc/categories_bloc.dart';
import 'package:kitchen/screens/bag_screen.dart';
import 'package:kitchen/screens/kitchen_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)
        => CategoriesBloc(CategoriesState([]))..add(const CategoriesEvent())),

      ],
      child: MaterialApp(
        title: 'Kitchen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          MainScreen.route: (context) => const MainScreen(),
          SearchScreen.route: (context) => const SearchScreen(),
          BagScreen.route: (context) => const BagScreen(),
          ProfileScreen.route: (context) => const ProfileScreen(),
          NaviScreen.route: (context) => const NaviScreen(),
          KitchenScreen.route: (context) => const KitchenScreen(),
        },
        initialRoute: NaviScreen.route,
      ),
    );
  }
}
