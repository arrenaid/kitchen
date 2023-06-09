import 'package:flutter/material.dart';
import 'package:kitchen/widgets/blue_button.dart';
import 'package:kitchen/widgets/location_upper.dart';

import '../constans.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);
  static const String route = "BasketScreen";

  @override
  Widget build(BuildContext context) {
    var name = 'Зеленый салат';
    var price = 390.0;
    var weight = 420.0;
    var count = 5;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              LocationWidget(),
              Expanded(
                //height: 500,
                child: ListView(
                  children: [
                    CardBag(
                        name: name, price: price, weight: weight, count: count),
                    CardBag(
                        name: name, price: price, weight: weight, count: count),
                    CardBag(
                        name: name, price: price, weight: weight, count: count),
                  ],
                ),
              ),
              BlueButton(
                  onTap: () {},
                  title: 'Оплатить $price ₽'),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBag extends StatelessWidget {
  const CardBag({
    Key? key,
    required this.name,
    required this.price,
    required this.weight,
    required this.count,
  }) : super(key: key);

  final String name;
  final double price;
  final double weight;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 62,
        child: Row(
          children: [
            Image.asset(imgAvatar),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: tsSubhead1,
                ),
                RichText(
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
              ],
            ),
            const Expanded(
                child: SizedBox(
              width: 1,
            )),
            Container(
              width: 119,
              height: 32,
              decoration: BoxDecoration(
                color: clrCounter,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 33,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        )),
                  ),
                  Text(
                    '$count',
                    style: tsSubhead1,
                  ),
                  SizedBox(
                    width: 33,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                        )),
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
