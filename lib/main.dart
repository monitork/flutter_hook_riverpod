import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_hook_riverpod_example/src/notifiers/lang_notifier.dart';
import 'package:flutter_hook_riverpod_example/src/notifiers/theme_notifier.dart';
import 'package:flutter_hook_riverpod_example/src/views/pages/routes.dart';
import 'package:flutter_hook_riverpod_example/src/views/pages/splash/splash_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/configs/theme.dart';
import 'data/lang/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: Wikobo()));
}

class Wikobo extends HookWidget {
  //  final providerMain = ChangeNotifierProvider((_) => LoginViewModel());
  // Cập nhập thay đổi từ setting
  const Wikobo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLang = useProvider(langChangeProvider);
    return MaterialApp(
      title: 'Wikobo',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: ThemeData.light(),
      themeMode: useProvider(ThemeNotifier.provider.state),
      onGenerateRoute: useProvider(routerProvider).onGenerateRoute,
      home: SplashPage(),
      locale: currentLang.appLocal,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
    );
  }
}
