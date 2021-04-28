import 'package:intl/intl.dart';

import '../models/reading.dart';

Map<ReadingState, String> readingStateTranslations = {
  ReadingState.wantToRead: Intl.message('El akarom olvasni'),
  ReadingState.isReading: Intl.message('Jelenleg olvasott könyvek'),
  ReadingState.read: Intl.message('Elolvasott könyvek'),
};