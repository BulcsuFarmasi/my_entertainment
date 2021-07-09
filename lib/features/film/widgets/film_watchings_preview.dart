import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/film_watching.dart';
import '../../../shared/translations/film_watching_state_tranlations.dart';
import './film_watching_preview.dart';

class FilmWatchingsPreview extends StatelessWidget {
  FilmWatchingsPreview(this.filmWatchingsByWatchingState, this.selectWatchingState);

  final MapEntry<FilmWatchingState, List<FilmWatching>> filmWatchingsByWatchingState;
  final Function selectWatchingState;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          selectWatchingState(filmWatchingsByWatchingState.key);
        },
        child: Column(
          children: [
            Container(
              child: Text(
                filmWatchingStateTranslations[filmWatchingsByWatchingState.key]!,
                style: theme.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            ...filmWatchingsByWatchingState.value.map((FilmWatching filmWatching) => FilmWatchingPreview(filmWatching)),
          ],
        ),
      ),
    );
  }
}
