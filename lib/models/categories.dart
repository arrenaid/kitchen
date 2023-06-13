import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories{
  final int id;
  final String name;
  final String image_url;
  Categories(this.id, this.name, this.image_url);

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}