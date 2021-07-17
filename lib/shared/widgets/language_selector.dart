import 'package:flutter/material.dart';

import '../../shared/languages.dart';
import '../../models/language.dart';

class LanguageSelector extends StatefulWidget {
  LanguageSelector(this.languageChanged);
  final Function languageChanged;
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  Language? selectedLanguage;

  void languageChanged(Language? newLanguage) {
    widget.languageChanged(newLanguage);
    setState(() {
      selectedLanguage = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      items: languages.values.map((Language language) {
        return DropdownMenuItem(
          value: language,
          child: Text(language.endonym),
        );
      }).toList(growable: false),
      onChanged: languageChanged,
    );
  }
}
