import 'package:flutter/material.dart';
import 'package:my_entertainment/shared/utils/enum_converter.dart';

import '../../models/reading.dart';
import './book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  final String newParam = 'new';
  final String group = 'group';
  final String detail = 'detail';
  final String book = 'book';
  final String books = 'books';

  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    final Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return Future.value(BookRoutePath.books());
    }
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == book) {
      if (uri.pathSegments[1] == group) {
        return Future.value(
            BookRoutePath.readingState(EnumConverter.stringToValue(uri.pathSegments[2], ReadingState.values)));
      }
      if (uri.pathSegments[1] == detail) {
        return Future.value(BookRoutePath.isbn(int.parse(uri.pathSegments[2])));
      }
    }
    if (uri.pathSegments[0] == book && uri.pathSegments[1] == newParam) {
      return Future.value(BookRoutePath.isNew());
    }

    return Future.value(BookRoutePath.books());
  }

  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isNew) {
      return RouteInformation(location: '/$book/$newParam');
    } else if (configuration.selectedReadingState != null) {
      return RouteInformation(
          location: '/$book/$group/${EnumConverter.valueToString(configuration.selectedReadingState!)}');
    } else if (configuration.selectedIsbn != null) {
      return RouteInformation(location: '/$book/$detail/${configuration.selectedIsbn}');
    } else {
      return RouteInformation(location: '/$book');
    }
  }
}
