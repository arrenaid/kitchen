import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen/bloc/bag_bloc.dart';
import 'package:kitchen/widgets/blue_button.dart';
import 'package:kitchen/widgets/location_upper.dart';

import '../constans.dart';
import '../models/dishes.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);
  static const String route = "BasketScreen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc,BagState>(
      builder: (context, state) {
        Set<Dishes> bag = state.bag.toSet();
        var bagCount = List.generate(bag.length, (index) { int count = 0;
          for(Dishes twin in state.bag){
            if(twin == bag.elementAt(index)) count++;
          }
        return count;
        });

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  LocationWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bag.length,
                      itemBuilder: (context, index) {
                        return CardBag(dishes: bag.elementAt(index), count: bagCount[index]);
                      },
                    ),
                  ),
                  BlueButton(
                      onTap: () {},
                      title: 'Оплатить ${state.amount} ₽'),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class CardBag extends StatelessWidget {
  const CardBag({
    Key? key, required this.dishes, required this.count,
  }) : super(key: key);
  final Dishes dishes;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 62,
        child: Row(
          children: [
            SizedBox(
              height: 62,
              width: 62,
              child: FadeInImage.assetNetwork(placeholder: imgAvatar,
                image: dishes.image_url ?? '', fit: BoxFit.contain,
                imageErrorBuilder: (context, error, trace) => const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 129,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishes.name,
                    style: tsSubhead1,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  RichText(
                    overflow: TextOverflow.fade,
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
                ],
              ),
            ),
            const Expanded(
                child: SizedBox(
              width: 1,
            )),
            Container(
               //width: 99,
               height: 35,
              decoration: BoxDecoration(
                color: clrCounter,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: ()  => context.read<BagBloc>().add(RemoveDishesEvent(dishes)),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 24,
                      ),
                    alignment: Alignment.topCenter,
                  ),
                  Text(
                    '${count}',
                    style: tsSubhead1,
                  ),
                  IconButton(
                      onPressed: () => context.read<BagBloc>().add(AddDishesEvent(dishes)),
                      icon: const Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
