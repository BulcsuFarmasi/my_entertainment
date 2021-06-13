import 'film.dart';
import 'language.dart';

class FilmRelease extends Film {
  DateTime? localPremier;
  String? localTitle;
  final Language language;
  bool original;

  FilmRelease(
      {required int id,
        required DateTime premier,
      this.localTitle,
      required String title,
      this.localPremier,
      required this.language, this.original = false})
      : super(id: id, premier: premier, title: title) {
    this.localPremier ??= premier;
    this.localTitle ??= title;
  }
}
