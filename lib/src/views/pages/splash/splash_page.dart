import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/providers/user_provider.dart';
import 'package:flutter_wikobo/src/views/pages/home/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userFuture = useProvider(authenticateProvider);
    return userFuture.when(data: (value) {
      return HomePage();
    }, loading: () {
      return Container(
        child: Center(child: CircularProgressIndicator()),
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
