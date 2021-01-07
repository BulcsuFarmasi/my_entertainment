import 'package:flutter/material.dart';
import 'package:my_entertainment/models/reading.dart';

class NewBook extends StatefulWidget {
  NewBook(this.addBook);

  final Function addBook;

  @override
  State<StatefulWidget> createState() {
    return _NewBookState();
  }
}

class _NewBookState extends State<NewBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Könyv címe'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Oldalszám'),
          keyboardType: TextInputType.number,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('Könyv hozzáadása'),
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
