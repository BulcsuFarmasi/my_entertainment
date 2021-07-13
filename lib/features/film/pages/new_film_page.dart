import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewFilmPage extends StatefulWidget {
  @override
  _NewFilmPageState createState() => _NewFilmPageState();
}

class _NewFilmPageState extends State<NewFilmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newFilm),
      ),
      body: Center(
        child: Text(newFilm),
      ),
    );
  }

  static final String newFilm = Intl.message('Új film');
}
