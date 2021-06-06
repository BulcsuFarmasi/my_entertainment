import '../general/general_route_path.dart';
import '../../models/film_watching.dart';

class FilmRoutePath extends GeneralRoutePath {
  FilmWatchingState? selectedWatchingState;

  FilmRoutePath.watchingState(this.selectedWatchingState);

  FilmRoutePath();
}