import 'package:flutter/material.dart';
import 'package:my_entertainment/features/film/widgets/film_watching_preview.dart';
import '../../../models/film_watching.dart';
import '../../../shared/translations/film_watching_state_tranlations.dart';

class FilmWatchingsPage extends StatelessWidget {
  FilmWatchingsPage(this.filmWatchingState, this.filmWatchings, this.selectFilmWatching);

  final FilmWatchingState filmWatchingState;
  final List<FilmWatching> filmWatchings;
  final Function selectFilmWatching;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          filmWatchingStateTranslations[filmWatchingState]!,
        ),
      ),
      body: Column(
        children: [
          ...filmWatchings.map(
            (FilmWatching filmWatching) => GestureDetector(
              onTap: () => selectFilmWatching(filmWatching.filmId),
              child: FilmWatchingPreview(filmWatching),
            ),
          )
        ],
      ),
    );
  }
}
