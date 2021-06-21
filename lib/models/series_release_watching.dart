import 'episode.dart';
import 'series_release.dart';

class SeriesReleaseWatching {
  final SeriesRelease seriesRelease;
  final Episode currentEpisode;
  final bool isCompleted;
  final int remainingEpisodes;


  SeriesReleaseWatching({required this.seriesRelease, required this.currentEpisode, required this.isCompleted, required this.remainingEpisodes});
}
