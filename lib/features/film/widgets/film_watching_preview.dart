import 'package:flutter/cupertino.dart';
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
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: 350,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  filmWatchingStateTranslations[filmWatchingsByWatchingState.key]!,
                  style: theme.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              ...filmWatchingsByWatchingState.value
                  .map((FilmWatching watching) =>
                      watching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original))
                  .map((FilmRelease filmRelease) => Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(children: [
                          Text(
                            filmRelease.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(DateFormat.yMd('hu').format(filmRelease.premier)),
                        ]),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
