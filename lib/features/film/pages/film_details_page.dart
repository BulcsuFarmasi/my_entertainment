import 'package:flutter/material.dart';
import 'package:my_entertainment/models/film_watching.dart';

class FilmDetailsPage extends StatefulWidget {
  FilmDetailsPage(this.filmWatching);

  final FilmWatching filmWatching;

  @override
  _FilmDetailPageState createState() => _FilmDetailPageState();
}

class _FilmDetailPageState extends State<FilmDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filmWatching.filmId.toString()),
      ),
    );
  }
}
