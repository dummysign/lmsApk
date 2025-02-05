import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/LoginResponse.dart';
import '../Services/ApiClient.dart';
import '../main.dart';

class LoginController extends ChangeNotifier{

  final ApiClient _apiClient = ApiClient();

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

  Future<void> Login() async {
    String name = nameController.text.trim();
    String password = passController.text.trim();


    if (name.isEmpty) {
      Fluttertoast.showToast(
        msg: "Name Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Password Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    final requestBody = {
      'memberId': name,
      'password': password
    };


    try {
      LoginResponse response =
      await _apiClient.apiService.Login(requestBody);

      if (response.responseCode == 200) {
        Fluttertoast.showToast(
          msg: "Sucesss: ${response.responseMessage}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        navigatorKey.currentState?.pushReplacementNamed('/home');

     //   notifyListeners();
      } else {
        Fluttertoast.showToast(
          msg: "Error: ${response.responseMessage}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }


}