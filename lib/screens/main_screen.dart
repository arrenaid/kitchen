import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';
import '../widgets/location_upper.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String route = "MainScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const LocationWidget(),
              Expanded(
                //height: 500,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  children:  [
                    CardCategory(title: 'Пекарни и кондитерские',
                    imageName: imgAvatar,),
                    CardCategory(title: 'Фастфуд',
                      imageName: imgAvatar,),
                    CardCategory(title: 'Азиатская кухня',
                      imageName: imgAvatar,),
                    CardCategory(title: 'Супы',
                      imageName: imgAvatar,),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key, required this.title, required this.imageName,
  }) : super(key: key);
  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          color: Colors.cyanAccent[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
                child: Image.asset(imageName, fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,
                  top: 12.0, right: 136.0),
              child: Text( title, style: tsMainCard,),
            ),
          ],
        ),
      ),
    );
  }
}
