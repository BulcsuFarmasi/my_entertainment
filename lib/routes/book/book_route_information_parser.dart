import 'package:flutter/material.dart';

import '../../models/reading.dart';
import './book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  final String newParam = 'new';
  final String group = 'group';
  final String detail = 'detail';
  final String book = 'book';
  final String books = 'books';

  @override
  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return Future.value(BookRoutePath.books());
    }
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == book) {
      if (uri.pathSegments[1] == group) {
        return Future.value(BookRoutePath.readingState(readingStateFromParam(uri.pathSegments[2])));
      }
      if (uri.pathSegments[1] == detail) {
        return Future.value(BookRoutePath.isbn(int.parse(uri.pathSegments[2])));
      }
    }
    if (uri.pathSegments[0] == book && uri.pathSegments[1] == newParam) {
      return Future.value(BookRoutePath.isNew());
    }

    // if(uri.pathSegments[0] == books) {
    //   return Future.value(BookRoutePath.books());
    // }

    return Future.value(BookRoutePath.books());
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isNew) {
      return RouteInformation(location: '/$book/$newParam');
    }
    if (configuration.selectedReadingState != null) {
      return RouteInformation(location: '/$book/$group/${readingStateToParam(configuration.selectedReadingState!)}');
    }
    if (configuration.selectedIsbn != null) {
      return RouteInformation(location: '/$book/$detail/${configuration.selectedIsbn}');
    }
    return RouteInformation(location: '/');
  }
}
