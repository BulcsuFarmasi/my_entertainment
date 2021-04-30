import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/reading.dart';

class BookDetailPage extends StatelessWidget {

  BookDetailPage(this.reading);

  final Reading reading;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(reading.book.title),), body: Column(children: [
      Text(author + reading.book.title),
      Text(isbn + reading.book.isbn.toString()),
      Text(publicationYear + reading.book.publicationYear.toString()),
    ],),);
  }

  static get author => Intl.message('Szerző: ');
  static get isbn => Intl.message('ISBN: ');
  static get publicationYear => Intl.message('Megjelenés éve: ');
}