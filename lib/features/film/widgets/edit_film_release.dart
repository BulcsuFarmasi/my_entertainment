import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/shared/widgets/language_selector.dart';

class EditFilmRelease extends StatefulWidget {
  @override
  _EditFilmReleaseState createState() => _EditFilmReleaseState();
}

class _EditFilmReleaseState extends State<EditFilmRelease> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextField(decoration: InputDecoration(labelText: textTitle),),
      TextField(decoration: InputDecoration(labelText: textPremier),),
      LanguageSelector(() {}),
      Checkbox(value: true, onChanged: (_) {});
    ],);
  }

  static String textTitle = Intl.message('Cím');
  static String textPremier = Intl.message('Premier');

}
