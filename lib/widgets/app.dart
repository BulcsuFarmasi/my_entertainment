import 'package:flutter/material.dart';

import './book/books.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Entertainment')),
        body: Books(),
      ),
    );
  }
}
