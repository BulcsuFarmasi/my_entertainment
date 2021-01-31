import 'package:flutter/material.dart';

import 'book_preview.dart';
import '../../models/book.dart';

class BookList extends StatelessWidget {
  const BookList(this.books);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: books.map((Book book) => BookPreview(book)).toList(),
        ));
  }
}
