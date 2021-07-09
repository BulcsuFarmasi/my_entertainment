import 'package:flutter/material.dart';

import './film_route_path.dart';
import '../../models/film_watching.dart';
import '../../shared/utils/enum_converter.dart';

class FilmRouteInformationParser extends RouteInformationParser<FilmRoutePath> {
  final String newParam = 'new';
  final String watchings = 'watchings';
  final String detail = 'detail';
  final String film = 'film';

  Future<FilmRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    final Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == film) {
      if (uri.pathSegments[1] == watchings) {
        return Future.value(
            FilmRoutePath.watchingState(EnumConverter.stringToValue(uri.pathSegments[2], FilmWatchingState.values)));
      }
      if (uri.pathSegments[1] == detail) {
        return Future.value(FilmRoutePath.watching(int.parse(uri.pathSegments[2])));
      }
      if (uri.pathSegments[1] == newParam) {
        return Future.value(FilmRoutePath.adding());
      }
    }

    return Future.value(null);
  }

  RouteInformation? restoreRouteInformation(FilmRoutePath configuration) {
    if (configuration.selectedWatchingState != null) {
      return RouteInformation(
          location: '/$film/$watchings/${EnumConverter.valueToString(configuration.selectedWatchingState)}');
    }
    if (configuration.selectedFilmId != null) {
      return RouteInformation(location: '/$film/$watchings/${configuration.selectedFilmId}');
    }
    if (configuration.adding) {
      return RouteInformation(location: '/$film/$newParam/');
    }
  }
}
