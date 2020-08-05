import 'package:flutter_wikobo/src/models/user.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthNotifier extends StateNotifier<User> {
  AuthNotifier(User state) : super(state ?? null);

  void add(User user) {
    state = user;
  }
}
