import 'book.dart';

class Reading {
  Reading(this.book, this.state, {this.currentPage});

  final Book book;
  final ReadingState state;
  final int? currentPage;
}

ReadingState readingStateFromParam(String readingStateParam) {
  ReadingState readingState = ReadingState.values.firstWhere((ReadingState readingState) {
    String value = readingState.toString();
    int locationOfDot = value.indexOf('.');
    return readingStateParam == value.substring(locationOfDot + 1);
  });
  return readingState;
}

String readingStateToParam(ReadingState readingState) {
    String value = readingState.toString();
    int locationOfDot = value.indexOf('.');
    return value.substring(locationOfDot + 1);
}





enum ReadingState { isReading, wantToRead, read }
