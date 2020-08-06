import 'package:flutter_wikobo/src/models/user.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((ref) => Dio());
final accountRepositoryProvider = Provider((ref) => AccountRepository(ref));

class AccountRepository {
  final ProviderReference _ref;

  AccountRepository(this._ref);

  Future<User> authenticate() async {
    final response = await _ref
        .read(dioProvider)
        .get('https://jsonplaceholder.typicode.com/users/1');
    print(response);
    return User.fromJson(response.data);
  }
}
