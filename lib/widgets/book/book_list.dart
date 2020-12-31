import 'package:flutter/material.dart';

import 'book_view.dart';
import '../../models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(
        title: 'A tó úrnője',
        basedOnTitle: 'Pani Jeziora',
        isbn: 9789634069294,
        publicationYear: 1999,
        author: 'Andrzej Sapkowski'),
    Book(
      title: 'Mi vagyunk a medvék',
      basedOnTitle: 'Björnstad',
      author: 'Fredrik Backman',
      publicationYear: 2016,
      isbn: 9789633245446,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: books.map((Book book) => BookView(book)).toList());
  }
}
