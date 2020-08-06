import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/views/pages/splash/splash_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);
  static const routeName = '/';
  static const pageName = 'Home';

  @override
  Widget build(BuildContext context) {
    final state = useProvider(userProvider).state;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Username: ${state.username}',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
