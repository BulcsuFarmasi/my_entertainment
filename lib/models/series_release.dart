import 'language.dart';
import 'series.dart';

class SeriesRelease extends Series {
  final Language language;
  final bool original;

  SeriesRelease(
      {required String title, DateTime? premier, DateTime? finale, required this.language, this.original = false})
      : super(title: title, premier: premier, finale: finale);
}
