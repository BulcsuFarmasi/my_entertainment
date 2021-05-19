import 'package:my_entertainment/models/language.dart';

import '../../models/film_release.dart';

class FilmState {
  List<FilmRelease> films = [
    FilmRelease(
        premier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        language: Language(endonym: 'Engish (US)', code: 'en-US')),
    FilmRelease(
        premier: DateTime(2021, 3, 18),
        localPremier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        localTitle: 'Zack Synder: Az igazság ligája',
        language: Language(endonym: 'magyar', code: 'hu-HU')),
  ];
}
