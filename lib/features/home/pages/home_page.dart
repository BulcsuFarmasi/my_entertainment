import 'package:flutter/material.dart';
import '../widgets/home_menu.dart';

class HomePage extends StatelessWidget {
  final Function setSelectedRoute;

  HomePage(this.setSelectedRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Entertainment'),
      ),
      body: HomeMenu(setSelectedRoute),
    );
  }
}
