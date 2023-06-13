// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishesResponse _$DishesResponseFromJson(Map<String, dynamic> json) =>
    DishesResponse(
      (json['dishes'] as List<dynamic>)
          .map((e) => Dishes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishesResponseToJson(DishesResponse instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
    };
