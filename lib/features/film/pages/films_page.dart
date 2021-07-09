import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/film_watching.dart';
import '../widgets/film_watchings_preview.dart';

class FilmsPage extends StatelessWidget {
  FilmsPage(this.filmWatchingByWatchingState, this.selectWatchingState);

  final Map<FilmWatchingState, List<FilmWatching>> filmWatchingByWatchingState;
  final Function selectWatchingState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Filmek')),
      ),
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...filmWatchingByWatchingState.entries
                  .map((MapEntry<FilmWatchingState, List<FilmWatching>> entry) => Container(
                      width: 350,
                      child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(10), child: FilmWatchingsPreview(entry, selectWatchingState)),
                      )))
                  .toList()
            ],
          )),
    );
  }
}
