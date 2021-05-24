import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import './features/app.dart';

void main() {
  initializeDateFormatting('hu');
  runApp(App());
}
