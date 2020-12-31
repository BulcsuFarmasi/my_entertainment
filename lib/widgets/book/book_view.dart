import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookView extends StatelessWidget {
  BookView(this.book);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(book.title),
        Text(book.basedOnTitle),
        Text(book.author),
        Text(book.isbn.toString()),
        Text(book.publicationYear.toString()),
      ],
    );
  }
}
