import 'film.dart';
import 'language.dart';

class FilmRelease extends Film {
  DateTime? localPremier;
  String? localTitle;
  final Language language;

  FilmRelease(
      {required int id,
        required DateTime premier,
      String? localTitle,
      required String title,
      DateTime? localPremier,
      required this.language})
      : super(id: id, premier: premier, title: title) {
    this.localPremier ??= premier;
    this.localTitle ??= title;
  }
}
