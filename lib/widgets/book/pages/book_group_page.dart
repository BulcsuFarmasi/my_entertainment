import 'package:flutter/material.dart';

import 'package:my_entertainment/models/book_group.dart';
import 'package:my_entertainment/models/reading.dart';
import 'package:my_entertainment/translations/reading_state_translations.dart';
import 'package:my_entertainment/widgets/book/widgets/book_preview.dart';

import '../../../models/book.dart';

class BookGroupPage extends StatelessWidget {
  BookGroupPage(this.bookGroup, this.readingState, this.selectIsbn);

  final BookGroup bookGroup;
  final ReadingState readingState;
  final Function selectIsbn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(readingStateTranslations[readingState]!),
      ),
      body: Column(children: bookGroup.books.map((Book book) {
        return BookPreview(book: book, selectIsbn: selectIsbn);
      },).toList() ),
    );
  }
}
