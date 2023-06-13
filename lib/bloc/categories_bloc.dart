import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:kitchen/models/categories.dart';
import 'package:kitchen/service/rest_client.dart';
import 'package:dio/dio.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState>{

  CategoriesBloc(super.initialState){
    on<CategoriesEvent> (_getCategory);
  }
   _getCategory(CategoriesEvent event, Emitter emit) async {
    final restClient = RestClient(Dio(BaseOptions(contentType: "application/json")));
    List<Categories> result;
    result = (await restClient.getCategories()).categories;
    emit(CategoriesState(result));
  }
}