import 'package:flutter/material.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obscureText = true;
  get obscureText => _obscureText;
  set obscureText(newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    }
    String pattern = r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}
