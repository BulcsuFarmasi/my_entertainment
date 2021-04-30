import 'package:flutter/material.dart';

import '../../../models/book.dart';

class BookListItem extends StatelessWidget {
  const BookListItem(this.book);

  final Book book;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [Text(book.title), Text(book.author)],
      ),
    );
  }
}
