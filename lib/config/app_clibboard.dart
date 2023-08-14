import 'package:flutter/services.dart';

class AppClipboard {
  AppClipboard._();

  static final AppClipboard instance = AppClipboard._();

  final String myPhone = '+55(31)9 9303-3936';
  final String _myPhone = '55 3199303-3936';
  final String myEmail = 'pvespindola.developer@gmail.com';

  void getPhone() {
    Clipboard.setData(ClipboardData(text: _myPhone));
  }
  void getEmail() {
    Clipboard.setData(ClipboardData(text: myEmail));
  }

}
