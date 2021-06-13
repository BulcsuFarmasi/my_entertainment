import 'package:my_entertainment/models/film_watching.dart';

import '../../shared/languages.dart';
import '../../models/film_release.dart';
import '../general_state.dart';

class FilmState extends GeneralState {
  static List<FilmRelease> films = [
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        language: languages['en-US']!,
        original: true),
    FilmRelease(
        id: 1,
        premier: DateTime(2021, 3, 18),
        localPremier: DateTime(2021, 3, 18),
        title: 'Zack Synder\'s Justice Leage',
        localTitle: 'Zack Synder: Az igazság ligája',
        language: languages['hu-HU']!),
    FilmRelease(id: 2, premier: DateTime(2020, 11, 10), title: 'Soul', language: languages['en-US']!, original: true),
    FilmRelease(
      id: 2,
      premier: DateTime(2021, 06, 03),
      title: 'Soul',
      localTitle: 'Lelki ismeretek',
      language: languages['hu-HU']!,
    ),
    FilmRelease(
        id: 3,
        premier: DateTime(2022, 06, 30),
        title: 'Minions: The Rise of Gru',
        language: languages['en-US']!,
        original: true),
    FilmRelease(
      id: 3,
      premier: DateTime(2022, 06, 30),
      title: 'Minions: The Rise of Gru',
      localTitle: 'Minyonok: Gru színre lép',
      language: languages['hu-HU']!,
    ),
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
      releasesWatched: {films[4]: false, films[5]: false},
      filmWatchingState: FilmWatchingState.plannedToWatch,
    )
  ];

  Map<FilmWatchingState, List<FilmWatching>> get filmWatchingByWatchingState {
    Map<FilmWatchingState, List<FilmWatching>> _filmWatchingsByWatchingState = {
      FilmWatchingState.allReleasesWatched: [],
      FilmWatchingState.partOfReleasesWatched: [],
      FilmWatchingState.plannedToWatch: [],
    };

    watchings.forEach((FilmWatching watching) {
      _filmWatchingsByWatchingState[watching.filmWatchingState]!.add(watching);
    });

    return _filmWatchingsByWatchingState;
  }

  FilmWatchingState? selectedWatchingState;
  FilmWatching? selectedWatching;

  void selectWatchingState(FilmWatchingState? newWatchingState) {
    selectedWatchingState = newWatchingState;
  }

  void selectWatching(FilmWatching? newWatching) {
    selectedWatching = newWatching;
  }
}
