part of 'bag_bloc.dart';
abstract class BagEvent extends Equatable{
}
class AddDishesEvent extends BagEvent{
  Dishes dishes ;
  AddDishesEvent(this.dishes);

  @override
  List<Object?> get props => [dishes];
}
class RemoveDishesEvent extends BagEvent{
  Dishes dishes ;
  RemoveDishesEvent(this.dishes);

  @override
  List<Object?> get props => [dishes];
}