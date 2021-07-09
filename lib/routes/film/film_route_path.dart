import '../general/general_route_path.dart';
import '../../models/film_watching.dart';

class FilmRoutePath extends GeneralRoutePath {
  FilmWatchingState? selectedWatchingState;
  int? selectedFilmId;
  bool adding = false;

  FilmRoutePath.watchingState(this.selectedWatchingState);

  FilmRoutePath.watching(this.selectedFilmId);

  FilmRoutePath.adding() : adding = true;

  FilmRoutePath();
}