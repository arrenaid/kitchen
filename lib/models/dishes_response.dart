import 'package:json_annotation/json_annotation.dart';
import 'package:kitchen/models/dishes.dart';
part 'dishes_response.g.dart';

@JsonSerializable()
class DishesResponse {
  List<Dishes> dishes;
  DishesResponse(this.dishes);

  factory DishesResponse.fromJson(Map<String, dynamic> json) => _$DishesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DishesResponseToJson(this);
}