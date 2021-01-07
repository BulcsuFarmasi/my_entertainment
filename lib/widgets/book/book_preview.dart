import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookPreview extends StatelessWidget {
  BookPreview(this.book);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(book.title),
        if (book.reading.currentPage != null) Text('Jelenlegi oldal: ${book.reading.currentPage}')
      ],
    );
  }
}
