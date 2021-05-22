import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/film/film_route_delegate.dart';
import 'package:my_entertainment/routes/film/film_route_information_parser.dart';
import '../routes/book/book_route_delegate.dart';
import '../routes/book/book_route_information_parser.dart';
import '../routes/film/film_route_delegate.dart';
import '../routes/film/film_route_information_parser.dart';
import '../routes/general/general_route_delegate.dart';
import '../routes/general/general_route_information_parser.dart';

class App extends StatelessWidget {
  final GeneralRouteInformationParser generalRouteInformationParser = GeneralRouteInformationParser([BookRouteInformationParser(), FilmRouteInformationParser(),]);
  final GeneralRouteDelegate generalRouteDelegate = GeneralRouteDelegate({'book': BookRouteDelegate(), 'film': FilmRouteDelegate()});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: generalRouteInformationParser,
      routerDelegate: generalRouteDelegate,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
