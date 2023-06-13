import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen/models/dishes.dart';
import 'package:kitchen/screens/meal_screen.dart';
import '../bloc/dishes_bloc.dart';
import '../constans.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({Key? key}) : super(key: key);
  static const String route = "KitchenScreen";
  List<Dishes>sortTag(List<Dishes> dishes, String tag ){
    List<Dishes> result = [];
    for(Dishes twin in dishes){
      if(twin.tegs == tag){
        result.add(twin);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DishesBloc()..add(const DishesEvent()),
        child: BlocBuilder<DishesBloc,DishesState>(
          builder: (context, state) {
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
                          IconButton(onPressed: (){},
                              icon: const Icon(CupertinoIcons.back)),
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
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                            return ChoiceChip(label: Text(state.tags[index]),
                              labelStyle: tsSubhead1.copyWith(
                                color: state.activeTag == index
                                    ? Colors.white: Colors.black,
                              ),
                              padding: const EdgeInsets.all(10),
                              selected: state.activeTag == index,
                              selectedColor: clrBlueActive,
                              disabledColor: clrBackMeal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            );
                           },
                           separatorBuilder: (BuildContext context,
                               int index) => const SizedBox(width: 8,),
                          itemCount: state.tags.length,
                        ),
                      ),
                      //GridMeals
                      Expanded(
                        child: GridMeals(dishes:state.dishes)
                        //sortTag(state.dishes, state.tags[state.activeTag])),//state.dishes
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
    ) ;
  }
}

class GridMeals extends StatelessWidget {
  const GridMeals({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<Dishes> dishes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 144,
          childAspectRatio: 109/144,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
        itemCount: dishes.length,
        itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            buildShowDialog(context, dishes[index]);
          },
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: clrBackMeal,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(placeholder: imgAvatar,
                    width: double.maxFinite,
                    image: dishes[index].image_url ?? '', fit: BoxFit.contain,
                    imageErrorBuilder: (context, error, trace) => const CircularProgressIndicator(),
                  ),
                )
            ,),
              const SizedBox(height: 5,),
              SizedBox(
                height: 30,
                child: Text(dishes[index].name, style: tsSubhead1,
                  overflow: TextOverflow.fade,),
              )
            ],
          ),
        );
        }
    );
  }

  Future<String?> buildShowDialog(BuildContext context, Dishes meal) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: MealScreen(dishes: meal,),
      ),
    );
  }
}
