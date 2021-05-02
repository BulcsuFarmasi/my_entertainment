import 'package:flutter/material.dart';

import '../../../models/book.dart';

class BookListItem extends StatelessWidget {
  const BookListItem(this.book);

  final Book book;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [Text(book.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), Text(book.author.name)],
      ),
    );
  }
}
