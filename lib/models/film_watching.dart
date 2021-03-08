import 'film_release.dart';

class FilmWatching {
  // The releases watched from a given film;
  final Map<FilmRelease, bool> releasesWatched;
  FilmWatchingState filmWatchingState;

  FilmWatching({required this.releasesWatched, this.filmWatchingState = FilmWatchingState.plannedToWatch});
}

enum FilmWatchingState { plannedToWatch, allRealeasesWatched, partOfReleasesWatched }
