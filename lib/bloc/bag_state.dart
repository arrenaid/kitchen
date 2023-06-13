part of 'bag_bloc.dart';
class BagState extends Equatable{
  List<Dishes> bag;
  int amount;
  BagState(this.bag, this.amount);

  @override
  List<Object?> get props => [bag, amount];
}