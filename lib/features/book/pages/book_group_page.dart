import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/book.dart';
import '../../../models/book_group.dart';
import '../../../models/reading.dart';
import '../../../shared/translations/reading_state_translations.dart';
import '../widgets/book_preview.dart';

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
      body: (bookGroup.books.isEmpty)
          ? Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15),
              child: Text(
                _textNoBooks,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: bookGroup.books.map(
              (Book book) {
                return BookPreview(book: book, selectIsbn: selectIsbn);
              },
            ).toList()),
    );
  }

  final String _textNoBooks = Intl.message('Ebben a katerógiában most nincs könyv');
}
