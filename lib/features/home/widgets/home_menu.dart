import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeMenu extends StatelessWidget {

  HomeMenu(this.setSelectedRoute);

  final Function setSelectedRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              setSelectedRoute('book');
            },
            child: ListTile(leading: Icon(Icons.book), title: Text(Intl.message('Könyvek')), horizontalTitleGap: 80)),
        GestureDetector(
            onTap: () {setSelectedRoute('film');},
            child: ListTile(
              leading: Icon(Icons.movie),
              title: Text(Intl.message('Filmek')),
              horizontalTitleGap: 80,
            )),
        GestureDetector(
          onTap: () {setSelectedRoute('series');},
          child: ListTile(
            leading: Icon(Icons.tv),
            title: Text(Intl.message(('Sorozatok'))),
            horizontalTitleGap: 80,
          ),
        ),
      ],
    );
  }
}
