import 'package:flutter/material.dart';
import 'package:my_entertainment/routes/book/book_route_delegate.dart';
import 'package:my_entertainment/routes/book/book_route_path.dart';
import './general_route_path.dart';

class GeneralRouteDelegate extends RouterDelegate<GeneralRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final BookRouteDelegate bookRouteDelegate = new BookRouteDelegate();

  GeneralRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(GeneralRoutePath configuration) {
    return bookRouteDelegate.setNewRoutePath(configuration as BookRoutePath);
  }



  GeneralRoutePath get currentConfiguration {
    return bookRouteDelegate.currentConfiguration;
  }

  bool onPopPage(Route route, result) {
    return bookRouteDelegate.onPopPage(route, result);

  }



  @override
  Widget build(BuildContext context) {
        return bookRouteDelegate.build(context);
  }
}
