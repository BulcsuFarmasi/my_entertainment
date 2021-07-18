import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/language.dart';
import '../../../shared/widgets/language_selector.dart';
import '../widgets/edit_film_release.dart';

class NewFilmPage extends StatefulWidget {
  @override
  _NewFilmPageState createState() => _NewFilmPageState();
}

class _NewFilmPageState extends State<NewFilmPage> {
  void languageChanged(Language language) {
    print(language.code);
    print(language.endonym);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newFilm),
      ),
      body: Column(
        children: [LanguageSelector(languageChanged), EditFilmRelease()],
      ),
    );
  }

  static final String newFilm = Intl.message('Új film');
}
