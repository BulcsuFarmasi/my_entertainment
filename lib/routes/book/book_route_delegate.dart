import 'package:flutter/material.dart';
import 'package:my_entertainment/widgets/book/pages/book_detail_page.dart';
import 'package:my_entertainment/widgets/book/pages/book_group_page.dart';
import './book_route_path.dart';
import '../../models/book.dart';
import '../../models/reading.dart';
import '../../state/book/book_state.dart';
import '../../widgets/book/pages/books_page.dart';
import '../../widgets/book/pages/new_book_page.dart';

class BookRouteDelegate extends RouterDelegate<BookRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;

  BookRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  final BookState bookState = BookState();

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) {
    if (configuration.isNew) {
      bookState.setAdding(true);
    }
    if (configuration.selectedReadingState != null) {
      bookState.selectReadingState(configuration.selectedReadingState);
    }
    if (configuration.selectedIsbn != null) {
      bookState.selectReading(bookState.readings!.firstWhere((Reading reading) => reading.book.isbn == configuration.selectedIsbn));
    }
    return Future.value(null);
  }



  BookRoutePath get currentConfiguration {
    if (bookState.adding) {
      return BookRoutePath.isNew();
    }
    if (bookState.selectedReadingState != null) {
      return BookRoutePath.readingState(bookState.selectedReadingState);
    }
    if (bookState.selectedReading != null) {
      return BookRoutePath.isbn(bookState.selectedReading!.book.isbn);
    }
    return BookRoutePath.books();
  }

  bool onPopPage(Route route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (bookState.adding) {
      bookState.setAdding(!bookState.adding);
    }
    if (bookState.selectedReading != null) {
      bookState.selectReading(null);
    }
    if (bookState.selectedReadingState != null) {
      bookState.selectReadingState(null);
    }
    notifyListeners();
    return true;

  }

  void setAdding(bool adding) {
    bookState.setAdding(adding);
    notifyListeners();
  }

  void addBook(Book book, Reading reading) {
    bookState.addBook(book, reading);
    bookState.setAdding(false);
    notifyListeners();
  }

  void selectReadingState(ReadingState readingState) {
    bookState.selectReadingState(readingState);
    notifyListeners();
  }

  void selectIsbn(int isbn) {
    bookState.selectReading(bookState.readings!.firstWhere((Reading reading) => reading.book.isbn == isbn));
    notifyListeners();
  }



  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(key: ValueKey('BooksPage'), child: BooksPage(bookState.bookGroupsByReadingState, setAdding, selectReadingState)),
        if (bookState.selectedReadingState != null)
          MaterialPage(
              key: ValueKey(bookState.selectedReadingState),
              child: (BookGroupPage(bookState.bookGroupsByReadingState[bookState.selectedReadingState]!,
                  bookState.selectedReadingState!, selectIsbn))),
        if (bookState.selectedReading != null)
          MaterialPage(key: ValueKey(bookState.selectedReading), child: BookDetailPage(bookState.selectedReading!)),
        if (bookState.adding)
          MaterialPage(key: ValueKey('NewBookPage'), child: NewBookPage(addBook))
      ],
      onPopPage: onPopPage,
    );
  }
}
