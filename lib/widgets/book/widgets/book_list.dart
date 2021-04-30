import 'package:flutter/material.dart';
import 'package:my_entertainment/models/book_group.dart';

import 'book_list_item.dart';
import '../../../models/reading.dart';

class BookList extends StatelessWidget {
  const BookList(this.bookGroup);

  final BookGroup bookGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: bookGroup.readings.map((Reading reading) => BookListItem(reading.book)).toList(),
        ));
  }
}
