class Language {
  final String endonym;

  // The code of language spoken in certain country expressed with ISO 639-1 and ISO 3166-1 alpha 2 separated with hyphen
  // ie de-DE for German spoken in Germany
  final String code;

  Language({required this.endonym, required this.code});
}
