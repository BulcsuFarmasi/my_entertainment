import 'package:meta/meta.dart';
import 'book.dart';
import 'reading.dart';

class BookGroup {
  List<Book> books;
  List<Reading> readings;

  BookGroup({@required this.books, @required this.readings});
}