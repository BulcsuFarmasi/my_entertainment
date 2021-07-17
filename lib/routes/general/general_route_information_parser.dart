import 'package:flutter/material.dart';

import './general_route_path.dart';

class GeneralRouteInformationParser extends RouteInformationParser<GeneralRoutePath> {
  final List<RouteInformationParser> routeInformationParsers;

  GeneralRouteInformationParser(this.routeInformationParsers);

  @override
  Future<GeneralRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    final Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return Future.value(GeneralRoutePath.home());
    }
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'books') {
        return Future.value(GeneralRoutePath.books());
      }
      if (uri.pathSegments[0] == 'films') {
        return Future.value(GeneralRoutePath.films());
      }
      if (uri.pathSegments[0] == 'series') {
        return Future.value(GeneralRoutePath.series());
      }
    }
    routeInformationParsers.forEach((RouteInformationParser routeInformationParser) async {
      GeneralRoutePath? routePath = await routeInformationParser.parseRouteInformation(routeInformation);
      if (routePath != null) {
        return Future.value(routePath);
      }
    });
    return Future.value(GeneralRoutePath.home());
  }

  @override
  RouteInformation? restoreRouteInformation(GeneralRoutePath configuration) {
    if (configuration.isHome) {
      return RouteInformation(location: '/');
    }
    if (configuration.isBooks) {
      return RouteInformation(location: '/books');
    }
    if (configuration.isFilms) {
      return RouteInformation(location: '/films');
    }
    if (configuration.isSeries) {
      return RouteInformation(location: '/series');
    }

    for (RouteInformationParser routeInformationParser in routeInformationParsers) {
      RouteInformation? routeInformation = routeInformationParser.restoreRouteInformation(configuration);
      if (routeInformation != null) {
        return routeInformation;
      }
    }
  }
}
