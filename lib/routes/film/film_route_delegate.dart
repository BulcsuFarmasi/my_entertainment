import 'package:flutter/material.dart';
import 'package:my_entertainment/features/film/pages/film_watchings_page.dart';
import 'package:my_entertainment/models/film_watching.dart';
import 'package:my_entertainment/routes/film/film_route_path.dart';
import 'package:my_entertainment/routes/sub_route_delegate.dart';

import '../../state/film/film_state.dart';

class FilmRouteDelegate extends SubRouteDelegate<FilmRoutePath> {
  @override
  List<MaterialPage> build(BuildContext context) {
    return [
      if (state.selectedWatchingState != null)
        MaterialPage(
            child: FilmWatchingsPage(
          state.selectedWatchingState!,
          state.filmWatchingByWatchingState[state.selectedWatchingState]!,
        ))
    ];
  }

  Function? _notifyListeners;

  set notifyListeners(Function newFunction) {
    _notifyListeners = newFunction;
  }

  @override
  Function get notifyListeners => _notifyListeners!;

  @override
  bool onPopPage(Route route, result) {
    if (state.selectedWatchingState != null) {
      state.setSelectedWatchingState(null);
      notifyListeners();
      return true;
    }
    return false;
  }

  FilmRoutePath get currentConfiguration {
    if (state.selectedWatchingState != null) {
      return FilmRoutePath.watchingState(state.selectedWatchingState);
    }
    return FilmRoutePath();
  }

  @override
  void setNewRoutePath(FilmRoutePath configuration) {
    if (configuration.selectedWatchingState != null) {
      state.setSelectedWatchingState(configuration.selectedWatchingState);
    }
  }

  void setSelectedWatchingState(FilmWatchingState watchingState) {
    state.setSelectedWatchingState(watchingState);
    notifyListeners();
  }

  FilmState state = FilmState();
}
