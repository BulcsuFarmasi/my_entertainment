import 'package:my_entertainment/models/film_watching.dart';
import 'package:my_entertainment/models/language.dart';

import '../../models/film_release.dart';

class FilmState {
  static List<FilmRelease> films = [
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        language: Language(endonym: 'Engish (US)', code: 'en-US'), original: true),
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        localPremier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        localTitle: 'Zack Synder: Az igazság ligája',
        language: Language(endonym: 'magyar', code: 'hu-HU')),
    FilmRelease(
        id: 2,
        premier: DateTime(2020, 11, 10),
        title: 'Soul',
        language: Language(endonym: 'Engish (US)', code: 'en-US'), original: true),
    FilmRelease(
        id: 2,
        premier: DateTime(2020, 11, 10),
        title: 'Soul',
        localTitle: 'Lelki ismeretek',
        language: Language(endonym: 'magyar', code: 'hu-HU')),
    FilmRelease(
        id: 3,
        premier: DateTime(2022, 06, 30),
        title: 'Minions: The Rise of Gru',
        language: Language(endonym: 'Engish (US)', code: 'en-US'), original: true),
    FilmRelease(
        id: 3,
        premier: DateTime(2022, 06, 30),
        title: 'Minions: The Rise of Gru',
        localTitle: 'Minyonok: Gru színre lép',
        language: Language(endonym: 'magyar', code: 'hu-HU')),
  ];

  List<FilmWatching> watchings = [
    FilmWatching(
      filmId: 1,
      releasesWatched: {films[0]: true, films[1]: true},
      filmWatchingState: FilmWatchingState.allReleasesWatched,
    ),
    FilmWatching(
      filmId: 2,
      releasesWatched: {films[2]: true, films[3]: false},
      filmWatchingState: FilmWatchingState.partOfReleasesWatched,
    ),
    FilmWatching(
      filmId: 3,
      releasesWatched: {films[0]: false, films[1]: false},
      filmWatchingState: FilmWatchingState.plannedToWatch,
    )
  ];
}
