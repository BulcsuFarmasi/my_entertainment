import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/film_release.dart';
import '../../../models/film_watching.dart';

class FilmWatchingPreview extends StatelessWidget {
  FilmWatchingPreview(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  Widget build(BuildContext context) {
    FilmRelease original =
        filmWatching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Padding(
        padding: EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Text(
              original.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              DateFormat.yMd('hu').format(original.premier),
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }


}
