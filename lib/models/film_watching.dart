import 'package:meta/meta.dart';
import 'film_release.dart';

class FilmWatching {
  // The releases watched from a given film;
  final Map<FilmRelease, bool> releasesWatched;
  FilmWatchingState filmWatchingState = FilmWatchingState.plannedToWatch;

  FilmWatching({@required this.releasesWatched, this.filmWatchingState});
}

enum FilmWatchingState { plannedToWatch, allRealeasesWatched, partOfReleasesWtached }
