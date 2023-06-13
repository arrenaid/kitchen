import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/dishes.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent,BagState>{
  BagBloc() : super(BagState(const [], 0),
  ){
    on<AddDishesEvent> (_onAdd);
    on<RemoveDishesEvent> (_onRemove);
  }
  _onAdd(AddDishesEvent event, Emitter emit){
    List<Dishes> twin = state.bag.toList();
    twin.add(event.dishes);
    emit(BagState(twin, _amount(twin)));
  }
  _onRemove(RemoveDishesEvent event, Emitter emit) {
    List<Dishes> twin = state.bag.toList();
    twin.remove(event.dishes);
    emit(BagState(twin, _amount(twin)));
  }
  int _amount(List<Dishes> bag){
    int resuslt = 0;
    for(Dishes dishes in bag){
      resuslt += dishes.price;
    }
    return resuslt;
  }
}