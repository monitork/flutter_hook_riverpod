import 'package:flutter/material.dart';

class UnFocus extends StatelessWidget {
  final Widget child;

  const UnFocus({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dùng để bọc form. Để un-focus keyboard
    return GestureDetector(
      child: child,
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
