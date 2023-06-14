import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitchen/service/rest_client.dart';
import 'package:dio/dio.dart';
import '../models/dishes.dart';
import '../models/dishes_response.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent,DishesState>{
  DishesBloc() : super(DishesState(dishes: [],
      tags: ['Все меню','Салаты',"С рыбой",'С рисом'],
      activeTag: 0),
  ){
    on<DishesEvent> (_onDishes);
    on<SelectTagEvent> (_onSelect);
  }
  _onDishes(DishesEvent event, Emitter emit) async {
    final restClient = RestClient(Dio(BaseOptions(contentType: "application/json")));
    DishesResponse response = await restClient.getDishes();
    emit(DishesState(dishes: response.dishes,
        tags: state.tags, activeTag: state.activeTag));
  }
  _onSelect(SelectTagEvent event, Emitter emit){
    emit(DishesState(dishes: state.dishes, tags: state.tags,
        activeTag: event.index));
  }
}