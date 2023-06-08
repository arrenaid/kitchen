import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitchen/constans.dart';

import '../bloc/navi_bloc.dart';


class NaviScreen extends StatelessWidget {
  const NaviScreen({Key? key}) : super(key: key);
  static const String route = "navi";
  static const double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NaviBloc(),
      child: BlocBuilder<NaviBloc, NaviState>(
          builder: (BuildContext context, NaviState state) {
            return Scaffold(
              body: IndexedStack(index: state.index, children: state.screens),
              extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    unselectedItemColor: clrGreyInactive,
                    selectedItemColor: clrBlueActive,
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    selectedLabelStyle: tsTab,
                    currentIndex: state.index,
                    items: _getNavigationItems(),
                    onTap: (index) {
                      context.read<NaviBloc>().add(NaviEvent(index));
                    }),

            );
          }),
    );
  }

  List<BottomNavigationBarItem> _getNavigationItems() {
    return [
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            iconNaviMain,
            color: clrBlueActive,
            width: iconSize,
            height: iconSize,
          ),
          icon: SvgPicture.asset(
            iconNaviMain,
            color: clrGreyInactive,
            width: iconSize,
            height: iconSize,
          ),
          label: 'Главная'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconNaviSearch,
            color: clrGreyInactive,
            width: iconSize,
            height: iconSize,
          ),
          activeIcon: SvgPicture.asset(
            iconNaviSearch,
            color: clrBlueActive,
            width: iconSize,
            height: iconSize,
          ),
          label: 'Поиск'
      ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconNaviBag,
            color: clrGreyInactive,
            width: iconSize,
            height: iconSize,
          ),
          activeIcon: SvgPicture.asset(
            iconNaviBag,
            color: clrBlueActive,
            width: iconSize,
            height: iconSize,
          ),
          label: 'Корзина'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconNaviProfile,
            color: clrGreyInactive,
            width: iconSize,
            height: iconSize,
          ),
          activeIcon: SvgPicture.asset(
            iconNaviProfile,
            color: clrBlueActive,
            width: iconSize,
            height: iconSize,
          ),
          label: 'Аккаунт'),
    ];
  }
}
