part of 'navi_bloc.dart';

class NaviEvent extends Equatable {
  final int index;

  const NaviEvent(this.index);

  @override
  List<Object?> get props => [index];
}
