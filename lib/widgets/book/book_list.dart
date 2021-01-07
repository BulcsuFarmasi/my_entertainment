import 'package:flutter/material.dart';

import 'book_preview.dart';
import '../../models/book.dart';

class BookList extends StatelessWidget {
  BookList(this.books);
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Column(children: books.map((Book book) => BookPreview(book)).toList());
  }
}
