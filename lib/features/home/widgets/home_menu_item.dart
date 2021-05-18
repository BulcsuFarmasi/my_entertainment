import 'package:flutter/material.dart';

class HomeMenuItem extends StatelessWidget {
  HomeMenuItem({required this.icon, required this.label, required this.route, required this.onTap});

  final IconData icon;
  final String label;
  final String route;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {onTap(route)},
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0xFFFFFAFA),
                border: Border.all(width: 1, color: Color(0xFF6666666)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(color: Color(0xFF777777), offset: Offset(2, 2), blurRadius: 1, spreadRadius: 1),
                ]),
            child: ListTile(
                contentPadding: EdgeInsets.all(20),
                leading: Icon(
                  icon,
                  size: 40,
                ),
                title: Text(
                  label,
                  style: TextStyle(fontSize: 40),
                ),
                horizontalTitleGap: 60)));
  }
}
