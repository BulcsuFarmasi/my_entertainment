import 'package:my_entertainment/models/film_watching.dart';
import 'package:my_entertainment/models/language.dart';

import '../../models/film_release.dart';

class FilmState {
  static List<FilmRelease> films = [
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        language: Language(endonym: 'Engish (US)', code: 'en-US')),
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        localPremier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        localTitle: 'Zack Synder: Az igazság ligája',
        language: Language(endonym: 'magyar', code: 'hu-HU')),
  ];

  List<FilmWatching> watchings = [
    FilmWatching(
      filmId: 1,
      releasesWatched: {films[0]: true, films[1]: true},
      filmWatchingState: FilmWatchingState.allReleasesWatched,
    )
  ];
}
