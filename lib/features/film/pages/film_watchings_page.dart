import 'package:flutter/material.dart';
import 'package:my_entertainment/features/film/widgets/film_watchings.dart';
import '../../../models/film_watching.dart';
import '../../../translations/film_watching_state_tranlations.dart';

class FilmWatchingsPage extends StatelessWidget {
  FilmWatchingsPage(this.filmWatchingState, this.filmWatchings);

  final FilmWatchingState filmWatchingState;
  final List<FilmWatching> filmWatchings;

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
          ...filmWatchings.map((FilmWatching filmWatching) => FilmWatchings(filmWatching)),
        ],
      ),
    );
  }
}
