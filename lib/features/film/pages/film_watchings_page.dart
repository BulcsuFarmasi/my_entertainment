import 'package:flutter/material.dart';
import 'package:my_entertainment/models/film_watching.dart';

class FilmWatchingsPage extends StatelessWidget {
  FilmWatchingsPage(this.filmWatchingState, this.filmWatchings);

  final FilmWatchingState filmWatchingState;
  final List<FilmWatching> filmWatchings;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(filmWatchingState.toString()),
    );
  }
}
