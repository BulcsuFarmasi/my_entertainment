import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/film_watching.dart';
import '../../../models/film_release.dart';

class FilmWatchingPreview extends StatelessWidget {
  FilmWatchingPreview(this.filmWatchingsByWatchingState);

  final MapEntry<FilmWatchingState, List<FilmWatching>> filmWatchingsByWatchingState;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(children: [
          Text(filmWatchingsByWatchingState.key.toString()),
          ...filmWatchingsByWatchingState.value
              .map((FilmWatching watching) =>
                  watching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original))
              .map(
                (FilmRelease filmRelease) => Column(children: [
                  Text(filmRelease.title),
                  Text(DateFormat.yMd('hu').format(filmRelease.premier)),
                ]),
              ),
        ]),
      ),
    );
  }
}
