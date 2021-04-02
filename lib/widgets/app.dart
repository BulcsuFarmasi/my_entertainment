import 'package:flutter/material.dart';

import 'book/pages/books_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontSize: 18),
              ),
        ),
        home: Navigator(
          pages: [
            MaterialPage(
              child: BookPage(),
              key: ValueKey('BookPage'),
            ),
          ],
          onPopPage: (Route route, result) => route.didPop(result),
        ));
  }
}
