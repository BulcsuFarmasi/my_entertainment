import 'package:flutter/material.dart';

import '../state/book/general_state.dart';

abstract class SubRouteDelegate<T> {
  void setNewRoutePath(T currentConfiguration);

  GeneralState get state;

  set notifyListeners(Function newFunction);

  Function get notifyListeners;

  T get currentConfiguration;

  bool onPopPage(Route route, dynamic result);

  List<MaterialPage> build(BuildContext buildContext);
}