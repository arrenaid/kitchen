import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constans.dart';
import '../widgets/blue_button.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({Key? key, required this.description,
    required this.price, required this.weight, required this.title, required this.imageName}) : super(key: key);
  final String title;
  final String imageName;
  final int price ;
  final int weight;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 232,
            decoration: BoxDecoration(
              color: clrBackMeal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(
                    child: Image.asset(imageName),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(onPressed: () {  },
                          icon: const Icon(CupertinoIcons.heart,
                            color: Colors.black,),),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.black,),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: tsHeadline3.copyWith(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: '$price ₽',
                style: tsSubhead1,
                children: <TextSpan>[
                  TextSpan(
                    text: ' · $weightг',
                    style: tsSubhead1.copyWith(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.left,
            style: tsSubhead1.copyWith(color: Colors.black.withOpacity(0.65)),
          ),

          const SizedBox(height: 16),
          BlueButton( onTap: () => Navigator.pop(context, 'OK'),
              title: 'Добавить в корзину')
        ],
      ),
    );
  }
}
