import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/book.dart';
import '../../models/reading.dart';

class NewBook extends StatefulWidget {
  NewBook(this.addBook);

  final Function addBook;

  @override
  State<StatefulWidget> createState() {
    return _NewBookState();
  }
}

class _NewBookState extends State<NewBook> {
  final Map<ReadingState, String> readingStateTranslations = {
    ReadingState.wantToRead: Intl.message('El akarom olvasni'),
    ReadingState.isReading: Intl.message('Éppen olvasom'),
    ReadingState.read: Intl.message('Már elolvastam'),
  };

  Book newBook;

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: Intl.message('Köny címe')),
        ),
        DropdownButton<ReadingState>(
          value: ReadingState.wantToRead,
          items: ReadingState.values.map((ReadingState readingState) {
            return DropdownMenuItem(
              value: readingState,
              child: Text(readingStateTranslations[readingState]),
            );
          }).toList(growable: false),
          onChanged: (_) {},
        ),
        TextField(
          decoration: InputDecoration(
              labelText: Intl.message('Melyik oldalon tartasz éppen?')),
          keyboardType: TextInputType.number,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text(Intl.message('Köny hozzáadása')),
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
