import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen/widgets/blue_button.dart';

import '../constans.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({Key? key}) : super(key: key);
  static const String route = "KitchenScreen";

  @override
  Widget build(BuildContext context) {
    var listMeals = ['Рис с овощами','Салат по восточному',
      'Рыба с овощами и рисом','Тортеллини','Зеленый салат','Рулеты из ветчины'
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
            height: 42,
            child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.back)),
                  const Expanded(child: SizedBox(width: 1,)),
                  const Text('Азиатская кухня',style: tsHeadline1,),
                  const Expanded(child: SizedBox(width: 1,)),
                  CircleAvatar(child: Image.asset(imgAvatar),),
                ]
            ),
          ),
        ),
              //chip
              SizedBox(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChoiceChip(label: Text('Все меню',
                      style: tsSubhead1,),
                      selected: true, backgroundColor: clrBlueActive,),
                    ChoiceChip(label: Text('Салаты',
                      style: tsSubhead1,),
                      selected: false, ),
                    ChoiceChip(label: Text('С рисом',
                      style: tsSubhead1,),
                      selected: false, backgroundColor: clrGreyInactive,),
                  ],
                ),
              ),
              //GridMeals
              Expanded(
                child: GridMeals(listMeals: listMeals),
              ),
            ],

          ),
        ),
      ),
    ) ;
  }
}

class GridMeals extends StatelessWidget {
  const GridMeals({
    Key? key,
    required this.listMeals,
  }) : super(key: key);

  final List<String> listMeals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 144,
          childAspectRatio: 109/144,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
        itemCount: listMeals.length,
        itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            buildShowDialog(context, listMeals[index]);
          },
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(imgAvatar, fit: BoxFit.cover,)),
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: 30,
                child: Text(listMeals[index], style: tsSubhead1,
                  overflow: TextOverflow.fade,),
              )
            ],
          ),
        );
        }
    );
  }

  Future<String?> buildShowDialog(BuildContext context, String meal) {
    var price = 390;
    var weight = 420;
    var discription = 'Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой';
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: SingleChildScrollView(
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
                        child: Image.asset(imgAvatar),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  meal,
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
                    discription,
                    textAlign: TextAlign.left,
                    style: tsSubhead1.copyWith(color: Colors.black.withOpacity(0.65)),
                  ),

              const SizedBox(height: 16),
              BlueButton( onTap: () => Navigator.pop(context, 'OK'),
                  title: 'Добавить в корзину')
            ],
          ),
        ),
      ),
    );
  }
}
