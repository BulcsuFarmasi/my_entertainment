import 'package:flutter/material.dart';

import '../../models/reading.dart';
import './book_route_path.dart';

class BookRouteInformationParser {
  final String newParam = 'new';
  final String group = 'group';
  final String detail = 'detail';
  final String book = 'book';
  final String books = 'books';

  BookRoutePath? parseRouteInformation(RouteInformation routeInformation) {
    final Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return BookRoutePath.books();
    }
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == book) {
      if (uri.pathSegments[1] == group) {
        return BookRoutePath.readingState(readingStateFromParam(uri.pathSegments[2]));
      }
      if (uri.pathSegments[1] == detail) {
        return BookRoutePath.isbn(int.parse(uri.pathSegments[2]));
      }
    }
    if (uri.pathSegments[0] == book && uri.pathSegments[1] == newParam) {
      return BookRoutePath.isNew();
    }

    if (uri.pathSegments[0] == books) {
      return BookRoutePath.books();
    }
  }

  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isNew) {
      return RouteInformation(location: '/$book/$newParam');
    } else if (configuration.selectedReadingState != null) {
      return RouteInformation(location: '/$book/$group/${readingStateToParam(configuration.selectedReadingState!)}');
    } else if (configuration.selectedIsbn != null) {
      return RouteInformation(location: '/$book/$detail/${configuration.selectedIsbn}');
    } else {
      return RouteInformation(location: '/$book');
    }
  }
}
