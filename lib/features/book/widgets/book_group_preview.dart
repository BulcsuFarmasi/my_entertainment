import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/book_group.dart';
import '../../../models/reading.dart';
import '../../../shared/translations/reading_state_translations.dart';
import 'book_list.dart';

class BookGroupPreview extends StatelessWidget {
  BookGroupPreview({required this.readingState, required this.bookGroup, required this.selectReadingState});

  final ReadingState readingState;
  final BookGroup bookGroup;
  final Function selectReadingState;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => selectReadingState(readingState),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Container(
          padding: EdgeInsets.all(10),
          width: 350,
          child: Column(
            children: [
              Text(
                Intl.message(readingStateLabelTranslations[readingState]!),
                style: theme.textTheme.headline6,
              ),
              BookList(bookGroup),
            ],
          ),
        ),
      ),
    );
  }
}
