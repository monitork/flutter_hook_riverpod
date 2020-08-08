import 'package:flutter_wikobo/data/local/user_preference.dart';
import 'package:flutter_wikobo/data/repository/account_repository.dart';
import 'package:flutter_wikobo/src/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final $family = FutureProvider.autoDispose.family;
final userProvider = StateProvider<User>((ref) => User());

final checkTokenProvider = FutureProvider<String>((ref) async {
  final reference = ref.read(accountRefProvider);
  final _token = await reference.fetchToken();
  return _token;
});

final authenticateProvider = FutureProvider<User>(
  (ref) async {
    final repository = ref.read(accountRepositoryProvider);
    final _newUser = await repository.authenticate();
    ref.read(userProvider).state = _newUser;
    return _newUser;
  },
);

final userTokenLogin = $family<bool, String>((ref, token) async {
  final repository = ref.read(accountRepositoryProvider);
  final _newUser = await repository.authenticate();
  if (_newUser == null) {
    return false;
  }
  //Update user state when done
  ref.read(userProvider).state = _newUser;
  return true;
});

final tokenLogin = Computed.family<AsyncValue<bool>, String>((read, token) {
  print('token: $token');
  return read(userTokenLogin(token)).whenData((value) => value);
});

final autoLogin = FutureProvider<bool>((ref) async {
  //  Trong Provider  => ko async wait được
  final _token = await ref.read(checkTokenProvider);
  if (_token == null) {
    return false;
  }
  print('Go here... $_token');
  return await ref.read(userTokenLogin(_token));
});
