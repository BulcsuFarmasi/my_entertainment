import 'package:flutter/material.dart';

import './film_route_path.dart';

class FilmRouteInformationParser extends RouteInformationParser<FilmRoutePath> {
  @override
  Future<FilmRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    return Future.value(FilmRoutePath());
  }
}