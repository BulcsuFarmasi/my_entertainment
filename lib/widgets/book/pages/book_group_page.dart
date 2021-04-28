import 'package:flutter/material.dart';

import 'package:my_entertainment/models/book_group.dart';
import 'package:my_entertainment/models/reading.dart';

class BookGroupPage extends StatelessWidget {

  BookGroupPage(this.bookGroup, this.readingState);

  final BookGroup bookGroup;
  final ReadingState readingState;


  @override
  Widget build(BuildContext context) {
    return Text(readingState.toString());
  }
}
