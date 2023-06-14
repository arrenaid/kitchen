import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen/bloc/bag_bloc.dart';
import '../constans.dart';
import '../models/dishes.dart';
import '../widgets/blue_button.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({Key? key, required this.dishes}) : super(key: key);
  final Dishes dishes;

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
                    child: FadeInImage.assetNetwork(placeholder: imgAvatar,
                      width: double.maxFinite,
                      image: dishes.image_url ?? '', fit: BoxFit.contain,
                      imageErrorBuilder: (context, error, trace) => const CircularProgressIndicator(),
                    ),
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
              dishes.name,
              style: tsHeadline2,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: '${dishes.price} ₽',
                style: tsSubhead1,
                children: <TextSpan>[
                  TextSpan(
                    text: ' · ${dishes.weight}г',
                    style: tsSubhead1.copyWith(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(dishes.description,
            textAlign: TextAlign.left,
            style: tsSubhead1.copyWith(color: Colors.black.withOpacity(0.65)),
          ),

          const SizedBox(height: 16),
          BlueButton( onTap: ()  {
            context.read<BagBloc>().add(AddDishesEvent(dishes));
            Navigator.pop(context, 'OK');
            },
              title: 'Добавить в корзину')

        ],
      ),
    );
  }
}
