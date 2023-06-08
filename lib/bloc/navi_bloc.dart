import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:kitchen/screens/kitchen_screen.dart';

import '../screens/bag_screen.dart';
import '../screens/main_screen.dart';
import '../screens/profile_screen.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  final int discoverIndex = 1;

  NaviBloc()
      : super(NaviState(0, [
    MainScreen(),
    KitchenScreen(),//SearchScreen(),
    BagScreen(),
    ProfileScreen()
  ])) {
    on<NaviEvent>(_onNavi);
  }

  _onNavi(NaviEvent event, Emitter emit) {
    emit(NaviState(event.index, state.screens));
  }
}
