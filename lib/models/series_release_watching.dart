import 'episode.dart';
import 'series_release.dart';

class SeriesReleaseWatching {
  final SeriesRelease seriesRelease;
  final Episode currentEpisode;
  final bool isCompleted;

  SeriesReleaseWatching({required this.seriesRelease, required this.currentEpisode, required this.isCompleted});
}
