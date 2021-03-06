import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/reading.dart';
import '../../../shared/translations/reading_state_translations.dart';
import '../widgets/book_data_row.dart';

class ReadingView extends StatefulWidget {
  final Reading reading;
  final Function modifyReading;

  ReadingView({required this.reading, required this.modifyReading});

  @override
  _ReadingViewState createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  bool displayModifyReadingState = false;
  bool displayModifyCurrentPage = false;

  int? currentPage;
  late ReadingState readingState;

  @override
  void initState() {
    currentPage = widget.reading.currentPage;
    readingState = widget.reading.state;
    super.initState();
  }

  void setDisplayModifyReadingState(bool newDisplay) {
    setState(() {
      displayModifyReadingState = newDisplay;
    });
  }

  void setDisplayModifyCurrentPage(bool newDisplay) {
    setState(() {
      displayModifyCurrentPage = newDisplay;
    });
  }

  void saveReading() {
    widget.modifyReading(Reading(widget.reading.book, readingState, currentPage: currentPage));
    setState(() {
      displayModifyReadingState = false;
      displayModifyCurrentPage = false;
    });
  }

  void saveReadingState(ReadingState? newReadingState) {
    setState(() {
      readingState = newReadingState!;
    });
  }

  void saveCurrentPage(String? newCurrentPage) {
    setState(() {
      currentPage = int.parse(newCurrentPage!);
    });
  }

  List<Widget> buildReadingStatus() {
    List<Widget> widgets = [
      BookDataRow(children: [
        Text(
          _textReadingStatus,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          readingStateTranslations[readingState]!,
          style: TextStyle(fontSize: 20),
        ),
      ]),
      ElevatedButton(
          onPressed: () {
            setDisplayModifyReadingState(true);
          },
          child: Text(_textNodifyState)),
    ];
    if (displayModifyReadingState) {
      widgets.add(DropdownButton<ReadingState>(
        value: readingState,
        items: ReadingState.values.map((ReadingState readingState) {
          return DropdownMenuItem(
            value: readingState,
            child: Text(readingStateTranslations[readingState]!),
          );
        }).toList(growable: false),
        onChanged: saveReadingState,
      ));
    }
    return widgets;
  }

  List<Widget> buildCurrentPage() {
    List<Widget> widgets = [
      BookDataRow(children: [
        Text(
          _textCurrentPage,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          currentPage != null ? currentPage.toString() : "",
          style: TextStyle(fontSize: 20),
        ),
      ]),
      ElevatedButton(
          onPressed: () {
            setDisplayModifyCurrentPage(true);
          },
          child: Text(_textReadFurther)),
    ];
    if (displayModifyCurrentPage) {
      widgets.add(TextFormField(
        onChanged: saveCurrentPage,
        initialValue: currentPage != null ? currentPage.toString() : "",
        keyboardType: TextInputType.number,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _textReading,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Container(
            child: Column(
              children: buildReadingStatus(),
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
          ),
          if (readingState == ReadingState.isReading)
            Container(
              child: Column(
                children: buildCurrentPage(),
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: EdgeInsets.only(top: 10, bottom: 40),
              width: double.infinity,
            ),
          if (displayModifyCurrentPage || displayModifyReadingState)
            ElevatedButton(
              child: Text(_textSave),
              onPressed: saveReading,
            )
        ],
      ),
    );
  }

  static final _textCurrentPage = Intl.message('Jelenlegi oldal: ');
  
  static final _textNodifyState = Intl.message('Státusz módosítása');
  
  static final _textReadingStatus = Intl.message('Olvasási státusz: ');
  
  
  static final _textReading = Intl.message('Olvasás');

  static final _textReadFurther = Intl.message('Olvastam még');



  static final _textSave = Intl.message('Mentés');

}
