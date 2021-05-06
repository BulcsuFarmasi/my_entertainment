import '../general/general_route_path.dart';

import '../../models/reading.dart';

class BookRoutePath extends GeneralRoutePath {
  int? selectedIsbn;
  ReadingState? selectedReadingState;
  bool isNew = false;

  BookRoutePath();

  BookRoutePath.isbn(this.selectedIsbn);

  BookRoutePath.readingState(this.selectedReadingState);

  BookRoutePath.isNew() : isNew = true;

  BookRoutePath.books();
}