import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/film_watching_preview.dart';
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
        body: (filmWatchings.isEmpty)
            ? Container(
                width: double.infinity,
                child: Text(
                  _textNoFilms,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : Column(
                children: filmWatchings
                    .map((FilmWatching filmWatching) => GestureDetector(
                        onTap: () => selectFilmWatching(filmWatching.filmId),
                        child: Container(
                          width: 350,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: FilmWatchingPreview(filmWatching),
                            ),
                          ),
                        )))
                    .toList(),
              ));
  }

  final String _textNoFilms = Intl.message('Ebben a kategóriában most nincs film');
}
