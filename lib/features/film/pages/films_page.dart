import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/film_watching.dart';
import '../../../models/film_release.dart';

class FilmsPage extends StatelessWidget {
  FilmsPage(this.filmWatchingByWatchingState);

  final Map<FilmWatchingState, List<FilmWatching>> filmWatchingByWatchingState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Intl.message('Filmek')),
        ),
        body: Column(
          children: [
            ...filmWatchingByWatchingState.entries
                .map((MapEntry<FilmWatchingState, List<FilmWatching>> entry) => Container(
                      child: Card(
                        child: Column(children: [
                          Text(entry.key.toString()),
                          ...entry.value
                              .map((FilmWatching watching) => watching.releasesWatched.keys
                                  .firstWhere((FilmRelease filmRelease) => filmRelease.original))
                              .map(
                                (FilmRelease filmRelease) => Column(children: [
                                  Text(filmRelease.title),
                                  Text(DateFormat.yMd().format(filmRelease.premier))
                                ]),
                              ),
                        ]),
                      ),
                    ))
                .toList()
          ],
        ));
  }
}
