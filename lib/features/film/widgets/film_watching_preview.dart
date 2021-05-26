import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../translations/film_watching_state_tranlations.dart';
import '../../../models/film_watching.dart';
import '../../../models/film_release.dart';

class FilmWatchingPreview extends StatelessWidget {
  FilmWatchingPreview(this.filmWatchingsByWatchingState);

  final MapEntry<FilmWatchingState, List<FilmWatching>> filmWatchingsByWatchingState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              filmWatchingStateTranslations[filmWatchingsByWatchingState.key]!,
              style: TextStyle(fontSize: 26, ),
            ),
            ...filmWatchingsByWatchingState.value
                .map((FilmWatching watching) =>
                    watching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original))
                .map((FilmRelease filmRelease) => Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(children: [
                        Text(filmRelease.title),
                        Text(DateFormat.yMd('hu').format(filmRelease.premier)),
                      ]),
                    )),
          ],
        ),
      ),
    );
  }
}
