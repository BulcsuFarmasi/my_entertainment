import 'package:flutter/material.dart';

import './film_route_path.dart';
import '../../models/film_watching.dart';
import '../../shared/enum_converter.dart';

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
    }

    return Future.value(null);
  }

  RouteInformation? restoreRouteInformation(FilmRoutePath configuration) {
    if (configuration.selectedWatchingState != null) {
      return RouteInformation(
          location: '/$film/$watchings/${EnumConverter.valueToString(configuration.selectedWatchingState)}');
    }
  }
}
