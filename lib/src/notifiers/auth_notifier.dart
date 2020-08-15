import 'package:flutter_hook_riverpod_example/data/local/user_preference.dart';
import 'package:flutter_hook_riverpod_example/data/repository/account_repository.dart';
import 'package:flutter_hook_riverpod_example/src/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final authProvider = StateNotifierProvider((ref) => _AuthNotifier(ref));

class _AuthNotifier extends StateNotifier<User> {
  final ProviderReference _ref;

  _AuthNotifier(this._ref) : super(null);

  Future<String> getToken() async {
    final reference = _ref.read(accountRefProvider);
    final _token = await reference.fetchToken();
    return _token;
  }

  Future<void> setToken(String token) async {
    final reference = _ref.read(accountRefProvider);
    reference.changeToken(token);
  }

  Future<bool> loginWithToken(String token) async {
    final repository = _ref.read(accountRepositoryProvider);
    final _newUser = await repository.authenticate();
    if (_newUser == null) {
      return false;
    }
//    setToken(token);
    state = _newUser;
    return true;
  }

  Future<bool> autoLogin() async {
    final _token = await this.getToken();
    if (_token == null) {
      return false;
    }
    return this.loginWithToken(_token);
  }
}
