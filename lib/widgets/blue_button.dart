import 'package:flutter/material.dart';
import 'package:kitchen/constans.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(clrBlueActive),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),),
      onPressed: onTap,
      child: Container(
          width: 325,
          height: 48,
          //padding: const EdgeInsets.all(20),
          child: Center(
              child: Text(
                title,
                style: tsHeadline3,
              ))),
    );
  }
}
