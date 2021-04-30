import 'package:flutter/cupertino.dart';

class BookDataRow extends StatelessWidget {

  BookDataRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return
      Container(margin: EdgeInsets.symmetric(vertical: 20), child: Row(children: children,));
  }
}
