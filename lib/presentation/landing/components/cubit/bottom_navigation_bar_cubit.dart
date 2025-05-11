import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit()
      : super(const BottomNavigationBarState(SelectedPage.home));

  void changePage(SelectedPage selectedPage) {
    emit(state.copyWith(selectedPage: selectedPage));
  }
}
