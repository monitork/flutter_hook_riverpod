import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/data/repository/account_repository.dart';
import 'package:flutter_wikobo/src/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateProvider<User>((ref) => User());
final authenticateProvider = FutureProvider<User>(
  (ref) async {
    final repository = ref.read(accountRepositoryProvider);
    final _newUser = await repository.authenticate();
    ref.read(userProvider).state = _newUser;
    return _newUser;
  },
);

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userFuture = useProvider(authenticateProvider);
    return userFuture.when(data: (value) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Username: ${value.name}',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Address: ${value.address.street}  ${value.address.suite}',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Company: ${value.address.street}  ${value.address.suite}',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
      // TODO: HomePage
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
