import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/film_release.dart';
import '../../../models/film_watching.dart';

class FilmDetailsPage extends StatefulWidget {
  FilmDetailsPage(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  _FilmDetailPageState createState() => _FilmDetailPageState();
}

class _FilmDetailPageState extends State<FilmDetailsPage> {

  List<Widget> buildReleases(Map<FilmRelease, bool> releasesWatched) {
    List<Widget> widgets = [];
    releasesWatched.forEach((FilmRelease release, bool watched) {
      widgets.add(Row(children: [
        Text(release.localTitle!),
        Text(DateFormat.yMd('hu').format(release.localPremier!)),
        Checkbox(value: watched, onChanged: (changedWatched) {}),
      ],));
    });
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    final FilmRelease original =
        widget.filmWatching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original);
    return Scaffold(
      appBar: AppBar(
        title: Text(original.title),
      ),
      body: Column(
        children:
          buildReleases(widget.filmWatching.releasesWatched)

      ),
    );
  }
}
