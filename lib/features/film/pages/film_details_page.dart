import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/translations/film_watching_state_tranlations.dart';

import '../../../models/film_release.dart';
import '../../../models/film_watching.dart';

class FilmDetailsPage extends StatefulWidget {
  FilmDetailsPage(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  _FilmDetailPageState createState() => _FilmDetailPageState();
}

class _FilmDetailPageState extends State<FilmDetailsPage> {
  late FilmWatching filmWatching;

  @override
  void initState() {
    super.initState();
    filmWatching = widget.filmWatching;
  }

  List<Widget> buildReleases(Map<FilmRelease, bool> releasesWatched) {
    List<Widget> widgets = [];
    releasesWatched.forEach((FilmRelease release, bool watched) {
      widgets.add(
        Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(release.title),
                Text(DateFormat.yMd('hu').format(release.premier)),
                Text(textIsOriginal),
                Checkbox(value: release.original, onChanged: null),
                Checkbox(
                    value: watched,
                    onChanged: (newWatched) {
                      setState(() {
                        filmWatching.releasesWatched[release] = newWatched!;
                        int numberOfWatchedReleases =
                            filmWatching.releasesWatched.values.where((bool watched) => watched).length;
                        if (numberOfWatchedReleases == filmWatching.releasesWatched.length) {
                          filmWatching.filmWatchingState = FilmWatchingState.allReleasesWatched;
                        } else if (numberOfWatchedReleases > 0) {
                          filmWatching.filmWatchingState = FilmWatchingState.partOfReleasesWatched;
                        } else {
                          filmWatching.filmWatchingState = FilmWatchingState.plannedToWatch;
                        }
                      });
                    }),
              ],
            )),
      );
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final FilmRelease original =
        filmWatching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original);
    return Scaffold(
      appBar: AppBar(
        title: Text(original.title),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            filmWatchingStateTranslations[filmWatching.filmWatchingState]!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...buildReleases(filmWatching.releasesWatched)
      ]),
    );
  }

  static String textIsOriginal = Intl.message('Eredeti?');
}
