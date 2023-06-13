import 'package:json_annotation/json_annotation.dart';
import 'package:kitchen/models/categories.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse{
  @JsonKey(name: "сategories")
  List<Categories> categories;
  CategoriesResponse(this.categories);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}