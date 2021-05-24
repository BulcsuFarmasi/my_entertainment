import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/features/film/widgets/film_watching_preview.dart';
import '../../../models/film_watching.dart';


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
                .map((MapEntry<FilmWatchingState, List<FilmWatching>> entry) => FilmWatchingPreview(entry))
                .toList()
          ],
        ));
  }
}
