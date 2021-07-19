import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/book.dart';
import '../../../models/person.dart';
import '../../../models/reading.dart';
import '../../../shared/translations/reading_state_translations.dart';

class NewBookPage extends StatefulWidget {
  NewBookPage(this.addBook);

  final Function addBook;

  @override
  _NewBookPageState createState() {
    return _NewBookPageState();
  }
}

class _NewBookPageState extends State<NewBookPage> {
  String? title;
  String? authorName;
  int? isbn;
  int? publicationYear;
  String? basedOnTitle;
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
      isbn: isbn!,
      author: Person(authorName!),
      title: title!,
      basedOnTitle: basedOnTitle,
      publicationYear: publicationYear!,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Új könyv')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: Intl.message('Könyv címe')),
              onChanged: (String newTitle) => setState(() {
                title = newTitle;
              }),
            ),
            TextField(
              decoration: InputDecoration(labelText: Intl.message('Könyv szerzője')),
              onChanged: (String newAuthorName) => setState(() {
                authorName = newAuthorName;
              }),
            ),
            TextField(
              decoration: InputDecoration(labelText: Intl.message('Kiadás éve')),
              keyboardType: TextInputType.number,
              onChanged: (String newPublicationYear) => setState(() {
                publicationYear = int.parse(newPublicationYear);
              }),
            ),
            TextField(
              decoration: InputDecoration(labelText: Intl.message('ISBN')),
              keyboardType: TextInputType.number,
              onChanged: (String newIsbn) => setState(() {
                isbn = int.parse(newIsbn);
              }),
            ),
            TextField(
              decoration: InputDecoration(labelText: Intl.message('Kiadás alapja')),
              onChanged: (String newBasedOnTitle) => setState(() {
                basedOnTitle = newBasedOnTitle;
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
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
