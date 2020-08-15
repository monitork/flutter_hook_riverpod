import 'package:flutter_hook_riverpod_example/data/repository/repository.dart';
import 'package:flutter_hook_riverpod_example/src/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountRepositoryProvider = Provider((ref) => AccountRepository(ref));

class AccountRepository {
  final ProviderReference _ref;

  AccountRepository(this._ref);

  Future<User> authenticate() async {
    final response = await _ref
        .read(dioProvider)
        .get('https://jsonplaceholder.typicode.com/users/1');
    return User.fromJson(response.data);
  }
}
