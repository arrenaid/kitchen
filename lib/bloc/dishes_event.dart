part of 'dishes_bloc.dart';
class DishesEvent extends Equatable{
  const DishesEvent();
  @override
  List<Object?> get props => [];

}
class SelectTagEvent extends DishesEvent{
  int index;
  SelectTagEvent(this.index);
  @override
  List<Object?> get props => [index];
}