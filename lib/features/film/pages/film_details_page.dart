import 'package:flutter/material.dart';

import '../../../models/film_release.dart';
import '../../../models/film_watching.dart';

class FilmDetailsPage extends StatefulWidget {
  FilmDetailsPage(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  _FilmDetailPageState createState() => _FilmDetailPageState();
}

class _FilmDetailPageState extends State<FilmDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final FilmRelease original =
        widget.filmWatching.releasesWatched.keys.firstWhere((FilmRelease filmRelease) => filmRelease.original);
    return Scaffold(
      appBar: AppBar(
        title: Text(original.title),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
