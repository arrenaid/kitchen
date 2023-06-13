import 'package:kitchen/models/categories_response.dart';
import 'package:kitchen/models/dishes.dart';
import 'package:kitchen/models/dishes_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../models/categories.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3')
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  @GET("/058729bd-1402-4578-88de-265481fd7d54")
  Future<CategoriesResponse> getCategories();

  @GET("/c7a508f2-a904-498a-8539-09d96785446e")
  Future<DishesResponse> getDishes();
}