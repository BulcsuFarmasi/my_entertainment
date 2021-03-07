import 'package:meta/meta.dart';

import 'language.dart';
import 'series.dart';

class SeriesRelease extends Series {
  DateTime localPremier;
  DateTime localFinale;
  String localTitle;
  final Language language;

  SeriesRelease(
      {@required DateTime premier,
      DateTime localPremier,
      DateTime finale,
      DateTime localFinale,
      String localTitle,
      @required String title,
      @required this.language})
      : super(premier: premier, finale: finale, title: title) {
    this.localPremier ??= premier;
    this.localFinale ??= localFinale;
    this.localTitle ??= title;
  }
}
