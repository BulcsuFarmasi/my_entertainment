import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './home_menu_item.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu(this.setSelectedRoute);

  final Function setSelectedRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeMenuItem(
          icon: Icons.book,
          label: Intl.message('Könyvek'),
          onTap: setSelectedRoute,
          route: 'book',
        ),
        HomeMenuItem(
          icon: Icons.movie,
          label: Intl.message('Filmek'),
          onTap: setSelectedRoute,
          route: 'film',
        ),
        HomeMenuItem(
          icon: Icons.tv,
          label: Intl.message('Sorozatok'),
          onTap: setSelectedRoute,
          route: 'series',
        ),
      ],
    );
  }
}
