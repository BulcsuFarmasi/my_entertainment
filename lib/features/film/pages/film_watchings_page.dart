import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        children: (filmWatchings.isEmpty)
            ? Text(_textNoFilms)
            : filmWatchings
            .map((FilmWatching filmWatching) {
          return GestureDetector(
            onTap: () => selectFilmWatching(filmWatching.filmId),
            child: FilmWatchingPreview(filmWatching),
          );
        })
            .toList(),
      ),
    );
  }

  final String _textNoFilms = Intl.message('Ebben a kategóriában most nincs film');
}
