import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/notifiers/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);
  static const routeName = '/';
  static const pageName = 'Home';

  @override
  Widget build(BuildContext context) {
    final state = useProvider(authProvider.state);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Username: ${state.name}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Address: ${state.address.street}  ${state.address.suite}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Company: ${state.company.name}  ${state.company.catchPhrase}',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
