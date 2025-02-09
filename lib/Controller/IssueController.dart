import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../Model/BookModel.dart';
import '../Model/IssueResponse.dart';
import '../Services/ApiClient.dart';
import '../Utils/UserPreferences.dart';
import '../main.dart';

class IssueController extends ChangeNotifier{

  final ApiClient _apiClient = ApiClient();

  Future<void> IssueRequest(BookModel book) async {

    await UserPreferences.init();
    UserPreferences userPreferences = UserPreferences();

    int? memberId = userPreferences.userId;
    String? email = userPreferences.userEmail;
    String? contactnumber = userPreferences.phoneNumber;
    String? name = userPreferences.username;
    String issueDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final requestBody = {
      'mid': memberId.toString(),
      'name': name,
      'dep': "",
      'sem': "",
      'contact': contactnumber,
      'email': email,
      'issueDate': issueDate,
      'returnDate': "",
      'bookname': book.bname,
      'publisherid':book.publisherid,
      'bookid': book.bid.toString(),
      "authorid": book.authid,
      'issuestatus': ""
    };




    try {
      IssueResponse response =
      await _apiClient.apiService.RequestIssue(requestBody);

      if (response.responseCode == 201) {
        Fluttertoast.showToast(
          msg: "Sucesss: ${response.responseMessag}",
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
          msg: "Error: ${response.responseMessag}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      debugPrint('Error fetching data: $e');
    }
  }

}