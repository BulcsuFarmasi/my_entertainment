import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Sorozatok')),
      ),
      body: Center(child: Text('Sorozatok')),
    );
  }
}