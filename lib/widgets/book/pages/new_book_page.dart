// TODO
// Refactor to page

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/models/book.dart';

import '../../../models/book.dart';
import '../../../models/reading.dart';

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

  String? title;
  ReadingState readingState = ReadingState.wantToRead;
  int? currentPage;

  void addBook() {
    if (title == null) {
      return;
    }
    Book newBook = createBook();
    Reading newReading = createReading(newBook);
    widget.addBook(newBook, newReading);
  }

  Book createBook() {
    return Book(
      isbn: 1234568910,
      author: 'E. Xample',
      title: title!,
      basedOnTitle: '',
      publicationYear: 1998,
    );
  }

  Reading createReading(Book book) {
    return Reading(
      book,
      readingState,
      currentPage: currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          Intl.message('Új könyv'),
          style: Theme.of(context).textTheme.headline6,
        ),
        TextField(
          decoration: InputDecoration(labelText: Intl.message('Könyv címe')),
          onChanged: (String newTitle) => setState(() {
            title = newTitle;
          }),
        ),
        DropdownButton<ReadingState>(
          value: readingState,
          items: ReadingState.values.map((ReadingState readingState) {
            return DropdownMenuItem(
              value: readingState,
              child: Text(readingStateTranslations[readingState]!),
            );
          }).toList(growable: false),
          onChanged: (ReadingState? newReadingState) => setState(() {
            readingState = newReadingState!;
          }),
        ),
        if (readingState == ReadingState.isReading)
          TextField(
            decoration: InputDecoration(labelText: Intl.message('Melyik oldalon tartasz éppen?')),
            keyboardType: TextInputType.number,
            onChanged: (String newCurrentPage) {
              setState(() {
                currentPage = int.parse(newCurrentPage);
              });
            },
          ),
        ElevatedButton(
          onPressed: addBook,
          child: Text(Intl.message('Könyv hozzáadása')),
          style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor) ,
        )
      ],
    );
  }
}
