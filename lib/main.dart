import 'package:flutter/material.dart';
import 'package:flutter_wikobo/src/notifiers/theme_notifier.dart';
import 'package:flutter_wikobo/src/views/pages/home/home_page.dart';
import 'package:flutter_wikobo/src/views/pages/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/configs/theme.dart';

void main() {
  runApp(ProviderScope(child: Wikobo()));
}

class Wikobo extends StatelessWidget {
  //  final providerMain = ChangeNotifierProvider((_) => LoginViewModel());
  // Cập nhập thay đổi từ setting

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikobo',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: ThemeData.dark(),
      themeMode: useProvider(ThemeNotifier.provider.state),
      onGenerateRoute: useProvider(routerProvider).onGenerateRoute,
      home: HomePage(),
    );
  }
}
