import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final Function setSelectedRoute;

  HomePage(this.setSelectedRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Entertainment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setSelectedRoute('book');
              },
              child: ListTile(leading: Icon(Icons.book), title: Text(Intl.message('Könyvek')), horizontalTitleGap: 80)),
          GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.movie),
                title: Text(Intl.message('Filmek')),
                horizontalTitleGap: 80,
              )),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.tv),
              title: Text(Intl.message(('Sorozatok'))),
              horizontalTitleGap: 80,
            ),
          ),
        ],
      ),
    );
  }
}
