import 'package:meta/meta.dart';

import 'series_release_watching.dart';

class SeriesWatching {
  final List<SeriesReleaseWatching> seriesRealeaseWatchings;
  final SeriesWatchingState seriesWatchingState;

  SeriesWatching({@required this.seriesRealeaseWatchings, @required this.seriesWatchingState});
}

enum SeriesWatchingState { plannedToWatch, partOfReleasesComleted, allRealeasesCompleted }
