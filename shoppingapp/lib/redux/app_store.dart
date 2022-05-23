//sua action , estado precisam ser classes

import 'package:flutter/material.dart';
import 'package:shoppingapp/redux/store.dart';

enum AppAction { increment, decrement, addByPost }

@immutable
class AppState {
  final int value;

  AppState({this.value = 0});
}

AppState _reducer(AppState state, AppAction action, int value) {
  if (action == AppAction.increment) {
    return AppState(value: state.value + value);
  } else if (action == AppAction.decrement) {
    return AppState(value: state.value - value);
  } else if (action == AppAction.addByPost) {
    return AppState(value: state.value + value);
  } else {
    return AppState(value: state.value);
  }
}

final appStore =
    Store<AppAction, AppState>(initialState: AppState(), reducer: _reducer);
