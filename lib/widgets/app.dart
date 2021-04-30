import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/book/book_route_delegate.dart';
import 'package:my_entertainment/routes/book/book_route_information_parser.dart';

class App extends StatelessWidget {
  final BookRouteInformationParser bookRouteInformationParser = BookRouteInformationParser();
  final BookRouteDelegate bookRouteDelegate = BookRouteDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: bookRouteInformationParser,
      routerDelegate: bookRouteDelegate,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
