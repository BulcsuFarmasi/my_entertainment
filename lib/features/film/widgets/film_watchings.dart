import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/film_release.dart';
import '../../../models/film_watching.dart';

class FilmWatchings extends StatelessWidget {
  FilmWatchings(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  Widget build(BuildContext context) {
    FilmRelease original =
        filmWatching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(children: [
        Text(
          original.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(DateFormat.yMd('hu').format(original.premier)),
      ]),
    );
  }
}
