import 'package:meta/meta.dart';

abstract class Film {
  final String title;

  // The date when the film first released anywhere
  final DateTime premier;

  Film({@required this.title, @required this.premier});
}
