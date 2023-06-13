part of 'dishes_bloc.dart';
class DishesState extends Equatable{
  List<Dishes> dishes;
  List<String> tags;
  int activeTag;
  DishesState({required this.dishes, required this.tags, required this.activeTag});

  @override
   List<Object?> get props => [dishes, activeTag];
}