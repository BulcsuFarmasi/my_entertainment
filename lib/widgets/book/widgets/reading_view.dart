import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/translations/reading_state_translations.dart';

import '../../../models/reading.dart';
import '../widgets/book_data_row.dart';

class ReadingView extends StatelessWidget {
  final Reading reading;
  final Function modifyReading;

  ReadingView({required this.reading, required this.modifyReading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Intl.message(Intl.message('Olvasás')),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        BookDataRow(children: [
          Text(
            readingStatus,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            readingStateTranslations[reading.state]!,
            style: TextStyle(fontSize: 20),
          ),
        ]),
        ElevatedButton(onPressed: () {}, child: Text(modifyState)),
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
          ]),
        ElevatedButton(onPressed: () {}, child: Text(readFurther))
      ],
    );
  }

  static get readingStatus => Intl.message('Olvasási státusz: ');

  static get currentPage => Intl.message('Jelenlegi oldal: ');

  static get readFurther => Intl.message('Olvastam még');

  static get modifyState => Intl.message('Státusz módosítása');
}
