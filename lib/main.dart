import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/notifiers/theme_notifier.dart';
import 'package:flutter_wikobo/src/views/pages/routes.dart';
import 'package:flutter_wikobo/src/views/pages/splash/splash_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/configs/theme.dart';

void main() {
  runApp(const ProviderScope(child: Wikobo()));
}

class Wikobo extends HookWidget {
  //  final providerMain = ChangeNotifierProvider((_) => LoginViewModel());
  // Cập nhập thay đổi từ setting
  const Wikobo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikobo',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: ThemeData.light(),
      themeMode: useProvider(ThemeNotifier.provider.state),
      onGenerateRoute: useProvider(routerProvider).onGenerateRoute,
      home: SplashPage(),
    );
  }
}
