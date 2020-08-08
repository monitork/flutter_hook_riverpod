import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/notifiers/auth_notifier.dart';
import 'package:flutter_wikobo/src/views/pages/auth/auth_page.dart';
import 'package:flutter_wikobo/src/views/pages/home/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final autoLoginProvider = FutureProvider<bool>((ref) async {
  return await ref.read(authProvider).autoLogin();
});

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(autoLoginProvider);
    final user = useProvider(authProvider.state);
    return auth.when(data: (value) {
      if (user != null) {
        return HomePage();
      }
      return AuthPage();
    }, loading: () {
      return Scaffold(
        body: Container(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }, error: (error, stack) {
      return Scaffold(
        body: Center(
          child: Text(
            'Username: $error',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
    });
  }
}
