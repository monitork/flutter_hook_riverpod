import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth/auth_page.dart';
import 'home/home_page.dart';

@immutable
class PageInfo {
  final String pageName;
  final String routeName;

  PageInfo({this.pageName, @required this.routeName});

  static List<PageInfo> get all => [
        PageInfo(pageName: AuthPage.pageName, routeName: AuthPage.routeName),
      ];
}

final routerProvider = Provider((_) => _Router());

class _Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    HomePage.routeName: (_) => const HomePage(),
  };

  Route onGenerateRoute(RouteSettings settings) {
    final pushPage = pushRoutes[settings.name];
    return MaterialPageRoute<void>(
      settings: settings,
      builder: pushPage,
    );
  }
}
