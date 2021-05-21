import 'film_release.dart';

class FilmWatching {
  // id of the watched film
  final int filmId;
  // The releases watched from a given film;
  final Map<FilmRelease, bool> releasesWatched;
  FilmWatchingState filmWatchingState;

  FilmWatching({required this.filmId, required this.releasesWatched, this.filmWatchingState = FilmWatchingState.plannedToWatch});
}

enum FilmWatchingState { plannedToWatch, allReleasesWatched, partOfReleasesWatched }
