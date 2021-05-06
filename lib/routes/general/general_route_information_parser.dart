import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/book/book_route_information_parser.dart';
import 'package:my_entertainment/routes/book/book_route_path.dart';


import './general_route_path.dart';

class GeneralRouteInformationParser extends RouteInformationParser<GeneralRoutePath> {

  BookRouteInformationParser bookRouteInformationParser = BookRouteInformationParser();

  @override
  Future<GeneralRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    return bookRouteInformationParser.parseRouteInformation(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(GeneralRoutePath configuration) {
   return bookRouteInformationParser.restoreRouteInformation(configuration as BookRoutePath);
  }
}
