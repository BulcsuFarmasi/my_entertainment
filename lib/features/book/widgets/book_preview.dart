import 'package:flutter/material.dart';

import '../../../models/book.dart';

class BookPreview extends StatelessWidget {
  BookPreview({required this.book, required this.selectIsbn});

  final Book book;
  final Function selectIsbn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => selectIsbn(book.isbn),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Padding(
            padding: EdgeInsets.all(
              15,
            ),
            child: Column(
              children: [Text(book.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),), Text(book.author.name, style: TextStyle(fontSize: 18),)],
            ),
          ),
        ),
      ),
    );
  }
}
