import 'package:flutter_wikobo/data/local/user_preference.dart';
import 'package:flutter_wikobo/data/repository/account_repository.dart';
import 'package:flutter_wikobo/src/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
