import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// import '../../../models/film_release.dart';
import '../widgets/edit_film_release.dart';

class NewFilmPage extends StatefulWidget {
  @override
  _NewFilmPageState createState() => _NewFilmPageState();
}

class _NewFilmPageState extends State<NewFilmPage> {

  List<bool> filmReleases = [];

  void addRelease() {
    setState(() {
      filmReleases.add(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newFilm),
      ),
      body: Column(
        children: [...filmReleases.map((e) => EditFilmRelease()).toList(), IconButton(icon: Icon(Icons.add), onPressed: addRelease)],
      ),
    );
  }

  static final String newFilm = Intl.message('Új film');
}
