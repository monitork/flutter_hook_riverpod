import 'package:flutter_wikobo/core/utils/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const USER_TOKEN = 'USER_TOKEN';
final accountRefProvider = Provider((ref) => AccountRef());

class AccountRef {
  Future<String> fetchToken() async {
    var prefs = await SpUtil.getInstance();
    return await prefs.getString(USER_TOKEN);
  }

  void changeToken(String token) async {
    if (token == '' || token == null) {
      return;
    }
    var prefs = await SpUtil.getInstance();
    await prefs.putString(USER_TOKEN, token);
  }
}
