import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_wikobo/src/notifiers/auth_notifier.dart';
import 'package:flutter_wikobo/src/views/widgets/platform_exception_alert_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appState = StateProvider((ref) => false);

class AuthPage extends HookWidget {
  static const routeName = '/auth';
  static const pageName = 'Auth';

  const AuthPage({Key key, this.loading}) : super(key: key);
  final ValueNotifier<bool> loading;

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authProvider);
    final loading = useProvider(appState);
    Future<void> _signInAnonymously() async {
      try {
        loading.state = true;
        await auth.loginWithToken('1');
      } on PlatformException catch (e) {
        await PlatformExceptionAlertDialog(
          title: 'Sign in failed',
          exception: e,
        ).show(context);
      } finally {
        loading.state = false;
      }
    }

    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () async => await _signInAnonymously(),
            child: Text('Login')),
      ),
    );
  }
}
