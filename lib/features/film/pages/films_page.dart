import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilmsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Filmek')),
      ),
      body: Center(child: Text('Filmek')),
    );
  }
}
