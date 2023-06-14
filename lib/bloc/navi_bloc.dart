import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:kitchen/screens/kitchen_screen.dart';
import 'package:kitchen/screens/search_screen.dart';

import '../screens/bag_screen.dart';
import '../screens/main_screen.dart';
import '../screens/profile_screen.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  final int discoverIndex = 1;

  NaviBloc()
      : super(const NaviState(0, [
    MainScreen(key: Key('6'),),
    SearchScreen(),
    BagScreen(),
    ProfileScreen()
  ])) {
    on<NaviEvent>(_onNavi);
    on<SwitchNaviEvent>(_onSwitch);
  }

  _onNavi(NaviEvent event, Emitter emit) {
    emit(NaviState(event.index, state.screens));
  }
  _onSwitch(SwitchNaviEvent event, Emitter emit){
    List<Widget> twin =[];
    twin.addAll(state.screens);
    twin[0] = twin.first.key == const MainScreen(key: Key('6')).key
        ?  KitchenScreen(key: const Key('9'),title: event.title,)
        : const MainScreen(key: Key('6'));
    emit(NaviState(state.index, twin));
  }
}
