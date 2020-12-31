import 'package:flutter/material.dart';

import './book/books.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Entertainment')),
      body: Books(),
    );
  }
}
