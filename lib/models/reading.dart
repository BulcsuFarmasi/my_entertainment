import 'book.dart';

class Reading {
  Reading(this.book, this.state, {this.currentPage});

  final Book book;
  final ReadingState state;
  final int currentPage;
}

enum ReadingState { isReading, wantToRead, read }
