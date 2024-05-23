import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  get obscureText => _obscureText;
  set obscureText(newState) {
    _obscureText = newState;
    notifyListeners();
  }
}
