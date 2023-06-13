import 'package:flutter/material.dart';
import 'package:kitchen/models/categories.dart';
import 'package:kitchen/models/categories_response.dart';
import 'package:kitchen/models/dishes.dart';
import 'package:kitchen/models/dishes_response.dart';
import 'package:kitchen/service/rest_client.dart';
import 'package:dio/dio.dart';

import '../constans.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String route = "ProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: _body(),
      // const SafeArea(
      //   child: Center(
      //     child: Text(
      //       'ProfileScreen',
      //       style: tsHeadline1,
      //     ),
      //   ),
      // ),
    );
  }

//   FutureBuilder _body() {
//     final dio = Dio(); // Provide a dio instance
//     dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
//     final api = RestClient(dio/*Dio(BaseOptions(contentType: "application/json"))*/);
//     return FutureBuilder(
//       future: api.getDishes(),
//         builder: (context, snapshot){
//         if(snapshot.connectionState == ConnectionState.done){
//           print(snapshot.toString());
//           print(snapshot.hasData);
//           print(snapshot.hasError);
//           print(snapshot.error.toString());
//           print(snapshot.data.toString());
//           print('______________');
//           if(snapshot.hasData) {
//             final CategoriesResponse response = snapshot.data;
//             return Expanded(child: ListView.builder(
//               itemCount: response.categories.length,
//                 itemBuilder: (context,index){
//                   return ViewCategory(data: response.categories[index]);
//                 }
//             ));
//           }
//           else {
//             return const Center(child: LinearProgressIndicator(),);
//           }
//         }else {
//           return const Center(child: CircularProgressIndicator(),);
//         }
//       }
//     );
//   }
// }

  FutureBuilder _body() {
    final api = RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
      future: api.getDishes(),
        builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          print(snapshot.connectionState);
          print(snapshot.hasData);
          print(snapshot.hasError);
          print(snapshot.error.toString());
          if(snapshot.hasData) {
            final DishesResponse response = snapshot.data;
            return GridMeals(listDieshes: response.dishes);
          }
          else {
            return const Center(child: LinearProgressIndicator(),);
          }
        }else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}

class GridMeals extends StatelessWidget {
  const GridMeals({
    Key? key,
    required this.listDieshes,
  }) : super(key: key);

  final List<Dishes> listDieshes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 144,
            childAspectRatio: 109 / 144,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemCount: listDieshes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //buildShowDialog(context, listMeals[index]);
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
                      child: FadeInImage.assetNetwork(placeholder: imgAvatar,
                        width: double.maxFinite,
                        image: listDieshes[index].image_url ?? '', fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, trace) => const CircularProgressIndicator(),
                      ),
                ),),
                const SizedBox(height: 5,),
                SizedBox(
                  height: 30,
                  child: Text(listDieshes[index].name, style: tsSubhead1,
                    overflow: TextOverflow.fade,),
                )
              ],
            ),
          );
        }
    );
  }
}

class ViewCategory extends StatelessWidget {
  const ViewCategory({
    Key? key, required this.data,
  }) : super(key: key);
  final Categories data;

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
                child: Image.network(data.image_url, fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,
                  top: 12.0, right: 136.0),
              child: Text( data.name, style: tsMainCard,),
            ),
          ],
        ),
      ),
    );
  }
}