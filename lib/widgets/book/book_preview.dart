import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookPreview extends StatelessWidget {
  const BookPreview(this.book);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Text(book.title),
          if (book.reading.currentPage != null) Text('Jelenlegi oldal: ${book.reading.currentPage}')
        ],
      ),
    );
  }
}
