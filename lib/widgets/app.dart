import 'package:flutter/material.dart';

import 'book/book_page.dart';

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
      home: Scaffold(
        appBar: AppBar(title: Text('My Entertainment')),
        body: BookPage(),
      ),
    );
  }
}
