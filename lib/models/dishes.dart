import 'package:json_annotation/json_annotation.dart';
part 'dishes.g.dart';

@JsonSerializable()
class Dishes{
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String? image_url;
  final List<String> tegs;

  Dishes(this.id, this.name, this.price, this.weight, this.description, this.image_url, this.tegs);

  factory Dishes.fromJson(Map<String, dynamic> json)  => _$DishesFromJson(json);
  Map<String, dynamic> toJson() => _$DishesToJson(this);
}