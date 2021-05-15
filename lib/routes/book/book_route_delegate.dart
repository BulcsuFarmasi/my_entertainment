import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/sub_route_delegate.dart';
import '../../features/book/pages/book_detail_page.dart';
import '../../features/book/pages/book_group_page.dart';
import './book_route_path.dart';
import '../../models/book.dart';
import '../../models/reading.dart';
import '../../state/book/book_state.dart';
import '../../features/book/pages/books_page.dart';
import '../../features/book/pages/new_book_page.dart';

class BookRouteDelegate extends SubRouteDelegate<BookRoutePath> with ChangeNotifier{
  BookRouteDelegate() ;

   BookState state = BookState();

  @override
  void setNewRoutePath(BookRoutePath configuration) {
    if (configuration.isNew) {
      state.setAdding(true);
    }
    if (configuration.selectedReadingState != null) {
      state.selectReadingState(configuration.selectedReadingState);
    }
    if (configuration.selectedIsbn != null) {
      state.selectReading(
          state.readings!.firstWhere((Reading reading) => reading.book.isbn == configuration.selectedIsbn));
    }
  }

  BookRoutePath get currentConfiguration {
    if (state.adding) {
      return BookRoutePath.isNew();
    } else if (state.selectedReadingState != null) {
      return BookRoutePath.readingState(state.selectedReadingState);
    } else if (state.selectedReading != null) {
      return BookRoutePath.isbn(state.selectedReading!.book.isbn);
    } else {
      return BookRoutePath.books();
    }
  }

  void onPopPage(Route route, result) {
    if (state.adding) {
      state.setAdding(!state.adding);
    }
    if (state.selectedReading != null && state.selectedReadingState != null) {
      state.selectReading(null);
    } else if (state.selectedReadingState != null) {
      state.selectReadingState(null);
    }
    notifyListeners();
  }

  void setAdding(bool adding) {
    state.setAdding(adding);
    notifyListeners();
  }

  void addBook(Book book, Reading reading) {
    state.addBook(book, reading);
    state.setAdding(false);
    notifyListeners();
  }

  void selectReadingState(ReadingState readingState) {
    state.selectReadingState(readingState);
    notifyListeners();
  }

  void selectIsbn(int isbn) {
    state.selectReading(state.readings!.firstWhere((Reading reading) => reading.book.isbn == isbn));
    notifyListeners();
  }

  void modifyReading(Reading newReading) {
    int readingIndex = state.readings!.indexWhere((Reading reading) => reading.book.isbn == newReading.book.isbn);
    state.readings![readingIndex] = newReading;
    notifyListeners();
  }


  @override
  List<MaterialPage> build(BuildContext context) {
    return [
        if (state.selectedReadingState != null)
          MaterialPage(
              key: ValueKey(state.selectedReadingState),
              child: (BookGroupPage(state.bookGroupsByReadingState[state.selectedReadingState]!,
                  state.selectedReadingState!, selectIsbn))),
        if (state.selectedReading != null)
          MaterialPage(
              key: ValueKey(state.selectedReading),
              child: BookDetailPage(state.selectedReading!, modifyReading)),
        if (state.adding) MaterialPage(key: ValueKey('NewBookPage'), child: NewBookPage(addBook))
      ];
  }


}
