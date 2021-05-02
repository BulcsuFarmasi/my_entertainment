import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/translations/reading_state_translations.dart';

import '../../../models/reading.dart';
import '../widgets/book_data_row.dart';

class ReadingView extends StatefulWidget {
  final Reading reading;
  final Function modifyReading;

  ReadingView({required this.reading, required this.modifyReading});

  @override
  _ReadingViewState createState() => _ReadingViewState();

  static get readingStatus => Intl.message('Olvasási státusz: ');

  static get currentPage => Intl.message('Jelenlegi oldal: ');

  static get readFurther => Intl.message('Olvastam még');

  static get modifyState => Intl.message('Státusz módosítása');
}

class _ReadingViewState extends State<ReadingView> {
  bool displayModifyReadingState = false;
  bool displayModifyCurrentPage = false;

  late Reading reading;

  @override
  void initState() {
    super.initState();
    reading = widget.reading;
  }

  void updateReading(Reading newReading) {
    setState(() {
      reading = newReading;
      widget.modifyReading(reading);
      displayModifyReadingState = false;
      displayModifyCurrentPage = false;
    });
  }

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
            ReadingView.readingStatus,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            readingStateTranslations[widget.reading.state]!,
            style: TextStyle(fontSize: 20),
          ),
        ]),
        ElevatedButton(onPressed: () {}, child: Text(ReadingView.modifyState)),
        if (displayModifyReadingState)
          DropdownButton<ReadingState>(
              value: widget.reading.state,
              items: ReadingState.values.map((ReadingState readingState) {
                return DropdownMenuItem(
                  value: readingState,
                  child: Text(readingStateTranslations[readingState]!),
                );
              }).toList(growable: false),
              onChanged: (ReadingState? newReadingState) {
                updateReading(Reading(reading.book, newReadingState!, currentPage: reading.currentPage));
              }),
        if (widget.reading.currentPage != null)
          BookDataRow(children: [
            Text(
              ReadingView.currentPage,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              widget.reading.currentPage.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ]),
        ElevatedButton(onPressed: () {setState(() {
          displayModifyCurrentPage = true;
        });}, child: Text(ReadingView.readFurther)),
        if (displayModifyCurrentPage)
          TextField(
            onChanged: (String newPage) {
              updateReading(Reading(reading.book, reading.state, currentPage: int.parse(newPage)));
            },
            controller: TextEditingController(text: reading.currentPage.toString()),
          ),
      ],
    );
  }
}
