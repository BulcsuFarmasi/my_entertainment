import 'package:flutter/material.dart';

import '../../../models/book.dart';
import '../../../models/reading.dart';

class BookPreview extends StatelessWidget {
  const BookPreview(this.book, this.reading);

  final Book book;
  final Reading reading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [Text(book.title), if (reading.currentPage != null) Text('Jelenlegi oldal: ${reading.currentPage}')],
      ),
    );
  }
}
