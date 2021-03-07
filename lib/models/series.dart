import 'package:meta/meta.dart';

abstract class Series {
  final String title;

  // The date when the series aired its first episode
  final DateTime premier;

  // The date when the series aired its last episode
  final DateTime finale;

  Series({@required this.title, @required this.premier, this.finale});
}
