import '../general/general_route_path.dart';
import '../../models/film_watching.dart';

class FilmRoutePath extends GeneralRoutePath {
  FilmWatchingState? selectedWatchingState;
  int? selectedFilmId;

  FilmRoutePath.watchingState(this.selectedWatchingState);

  FilmRoutePath.watching(this.selectedFilmId);

  FilmRoutePath();
}