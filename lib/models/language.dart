import 'package:meta/meta.dart';

class Language {
  final String endonym;
  // The code of language spoken in certain country expressed with ISO 639-1 and ISO 3166-1 alpha 2 separated with dash
  // ie de-DE for German spoken in Germany
  final String code;

  Language({this.endonym, this.code});
}