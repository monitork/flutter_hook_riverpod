import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth';
  static const pageName = 'Auth';

  const AuthPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(onPressed: null, child: Text('Login')),
      ),
    );
  }
}
