import 'package:flutter/material.dart';
import '../../../models/reading.dart';

class BookDetailPage extends StatelessWidget {

  BookDetailPage(this.reading);

  final Reading reading;


  @override
  Widget build(BuildContext context) {
    return Text(reading.book.title);
  }
}