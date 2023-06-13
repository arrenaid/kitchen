part of 'categories_bloc.dart';
class CategoriesState{
  List<Categories> categories;
  CategoriesState(this.categories);

  List<Object?> get props => [categories];
}