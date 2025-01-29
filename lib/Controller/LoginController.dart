import 'package:flutter/cupertino.dart';

import '../main.dart';

class LoginController extends ChangeNotifier{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void onForgotPassword() {
    // Navigate to Forgot Password screen
    navigatorKey.currentState?.pushNamed('/forgotPassword');
  }

  void onSignUp() {
    // Navigate to Sign Up screen
    navigatorKey.currentState?.pushNamed('/signUp');
  }
}