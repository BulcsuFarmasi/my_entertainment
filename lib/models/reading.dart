class Reading {
  Reading(this.state, {this.currentPage});
  final ReadingState state;
  final int currentPage;
}

enum ReadingState { wantToRead, isReading, read }
