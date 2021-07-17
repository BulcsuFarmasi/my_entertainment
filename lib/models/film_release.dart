import 'film.dart';
import 'language.dart';

class FilmRelease extends Film {
  final Language language;
  bool original;

  FilmRelease(
      {required int id,
      required String title,
      required DateTime premier,
      required this.language,
      this.original = false})
      : super(id: id, title: title, premier: premier);
}
