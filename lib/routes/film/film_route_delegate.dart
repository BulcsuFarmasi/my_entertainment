

import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/film/film_route_path.dart';
import 'package:my_entertainment/routes/sub_route_delegate.dart';

import '../../state/film/film_state.dart';

class FilmRouteDelegate extends SubRouteDelegate<FilmRoutePath> {

 @override
 List<MaterialPage> build(BuildContext context) {
  return [];
 }

 Function? _notifyListeners;

 set notifyListeners(Function newFunction) {
  _notifyListeners = newFunction;
 }
 @override
 Function get notifyListeners => _notifyListeners!;

 @override
 bool onPopPage(Route route, result) {
   return false;
 }

 FilmRoutePath get currentConfiguration {
  return FilmRoutePath();
 }

 @override
 void setNewRoutePath(FilmRoutePath configuration){

 }

 FilmState state = FilmState();
}