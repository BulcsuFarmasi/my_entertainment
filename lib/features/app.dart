import 'package:flutter/material.dart';
import '../routes/book/book_route_delegate.dart';
import '../routes/book/book_route_information_parser.dart';
import '../routes/general/general_route_delegate.dart';
import '../routes/general/general_route_information_parser.dart';

class App extends StatelessWidget {
  final GeneralRouteInformationParser generalRouteInformationParser = GeneralRouteInformationParser([BookRouteInformationParser()]);
  final GeneralRouteDelegate generalRouteDelegate = GeneralRouteDelegate({'book': BookRouteDelegate()});

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
