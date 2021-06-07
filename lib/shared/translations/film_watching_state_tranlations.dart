import 'package:intl/intl.dart';

import '../../models/film_watching.dart';

Map<FilmWatchingState, String> filmWatchingStateTranslations = {
  FilmWatchingState.plannedToWatch: Intl.message('Megnézendő filmek'),
  FilmWatchingState.partOfReleasesWatched: Intl.message('Nem az összes nyelven megnézve'),
  FilmWatchingState.allReleasesWatched: Intl.message('Összes nyelven megnézve'),
};