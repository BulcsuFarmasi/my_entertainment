import 'package:flutter/material.dart';

import '../../features/film/pages/film_watchings_page.dart';
import '../../features/film/pages/film_details_page.dart';
import '../../models/film_watching.dart';
import '../../routes/film/film_route_path.dart';
import '../../routes/sub_route_delegate.dart';

import '../../state/film/film_state.dart';

class FilmRouteDelegate extends SubRouteDelegate<FilmRoutePath> {
  @override
  List<MaterialPage> build(BuildContext context) {
    return [
      if (state.selectedWatchingState != null)
        MaterialPage(
            child: FilmWatchingsPage(state.selectedWatchingState!,
                state.filmWatchingByWatchingState[state.selectedWatchingState]!, selectWatching)),
      if (state.selectedWatching != null)
        MaterialPage(
            child: FilmDetailsPage(
          state.selectedWatching!,
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
    if (state.selectedWatchingState != null && state.selectedWatching != null) {
      state.selectWatching(null);
      notifyListeners();
      return true;
    }
    if (state.selectedWatchingState != null) {
      state.selectWatchingState(null);
      notifyListeners();
      return true;
    }
    return false;
  }

  FilmRoutePath get currentConfiguration {
    if (state.selectedWatchingState != null) {
      return FilmRoutePath.watchingState(state.selectedWatchingState);
    }
    if (state.selectedWatching != null) {
      return FilmRoutePath.watching(state.selectedWatching?.filmId);
    }
    return FilmRoutePath();
  }

  @override
  void setNewRoutePath(FilmRoutePath configuration) {
    if (configuration.selectedWatchingState != null) {
      state.selectWatchingState(configuration.selectedWatchingState);
    }
    if (configuration.selectedFilmId != null) {
      state.selectWatching(state.watchings
          .firstWhere((FilmWatching filmWatching) => filmWatching.filmId == configuration.selectedFilmId));
    }
  }

  void selectWatchingState(FilmWatchingState watchingState) {
    state.selectWatchingState(watchingState);
    notifyListeners();
  }

  void selectWatching(int filmId) {
    state.selectWatching(state.watchings.firstWhere((FilmWatching filmWatching) => filmWatching.filmId == filmId));
    notifyListeners();
  }

  FilmState state = FilmState();
}
