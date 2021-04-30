import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/widgets/book/widgets/book_data_row.dart';
import '../../../models/reading.dart';

class BookDetailPage extends StatelessWidget {
  BookDetailPage(this.reading);

  final Reading reading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reading.book.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            BookDataRow(children: [
              Text(
                author,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                reading.book.author,
                style: TextStyle(fontSize: 20),
              )
            ]),
            BookDataRow(children: [
              Text(
                isbn,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                reading.book.isbn.toString(),
                style: TextStyle(fontSize: 20),
              )
            ]),
            BookDataRow(children: [
              Text(
                publicationYear,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                reading.book.publicationYear.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ]),
            if (reading.book.basedOnTitle != null)
              BookDataRow(children: [
                Text(
                  basedOnTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  reading.book.basedOnTitle!,
                  style: TextStyle(fontSize: 20),
                )
              ]),
            if (reading.currentPage != null)
              BookDataRow(children: [
                Text(
                  currentPage,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  reading.currentPage.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(onPressed: () {}, child: Text(readFurther))
              ]),
          ],
        ),
      ),
    );
  }

  static get author => Intl.message('Szerző: ');

  static get isbn => Intl.message('ISBN: ');

  static get publicationYear => Intl.message('Megjelenés éve: ');

  static get basedOnTitle => Intl.message('Eredeti cím: ');

  static get currentPage => Intl.message('Jelenlegi oldal: ');

  static get readFurther => Intl.message('Olvastam még');
}
