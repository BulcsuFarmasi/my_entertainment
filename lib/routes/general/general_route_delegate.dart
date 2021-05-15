import 'package:flutter/material.dart';

import './general_route_path.dart';
import '../../features/book/pages/books_page.dart';
import '../../features/home/home_page.dart';
import '../../routes/sub_route_delegate.dart';
import '../../state/book/book_state.dart';

class GeneralRouteDelegate extends RouterDelegate<GeneralRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, SubRouteDelegate> routeDelegates;

  String? selectedRoute;

  GeneralRouteDelegate(this.routeDelegates) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(GeneralRoutePath configuration) {
    selectedRoute = '';
    if (configuration.isHome) {
      selectedRoute = home;
    } else if (configuration.isFilms) {
      selectedRoute = film;
    } else if (configuration.isSeries) {
      selectedRoute = series;
    } else if (configuration.isBooks) {
      selectedRoute = book;
    }
    if (selectedRoute!.isEmpty) {
      for (SubRouteDelegate routeDelegate in routeDelegates.values) {
        routeDelegate.setNewRoutePath(currentConfiguration);
      }
    }
    return Future.value(null);
  }

  GeneralRoutePath get currentConfiguration {
    switch (selectedRoute) {
      case home:
        return GeneralRoutePath.home();
      case book:
        return GeneralRoutePath.books();
      case film:
        return GeneralRoutePath.films();
      case series:
        return GeneralRoutePath.series();
    }
    for (SubRouteDelegate routeDelegate in routeDelegates.values) {
      if (routeDelegate.currentConfiguration != null) {
        return routeDelegate.currentConfiguration;
      }
    }
    return GeneralRoutePath.home();
  }

  bool onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    for (SubRouteDelegate routeDelegate in routeDelegates.values) {
      routeDelegate.onPopPage(route, result);
    }
    return true;
  }

  void setSelectedRoute(String newRoute) {
    selectedRoute = newRoute;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(setSelectedRoute),
        ),
        if (selectedRoute == book)
        MaterialPage(
            key: ValueKey('BooksPage'),
            child: BooksPage(
              (routeDelegates[book]!.state as BookState).bookGroupsByReadingState,
              (routeDelegates[book]!.state as BookState).setAdding,
              (routeDelegates[book]!.state as BookState).selectReadingState,
            )),
        for (SubRouteDelegate routeDelegate in routeDelegates.values) ...routeDelegate.build(context),
      ],
      onPopPage: onPopPage,
    );
  }

  static const String book = 'book';
  static const String film = 'film';
  static const String series = 'series';
  static const String home = 'home';
}
