

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/IssueModel.dart';
import '../Model/RequestListResponse.dart';
import '../Services/ApiClient.dart';
import '../Utils/UserPreferences.dart';

class RequestListController extends ChangeNotifier{
final ApiClient _apiClient = ApiClient();
List<IssueModel> bookList = [];
bool isLoading = true;

Future<void> getStateList() async {
  await UserPreferences.init();
  UserPreferences userPreferences = UserPreferences();
  int? memberId = userPreferences.userId;
  String? email = userPreferences.userEmail;
  String? contactnumber = userPreferences.phoneNumber;
  String? name = userPreferences.username;
  try {
    RequestListResponse response =
    await _apiClient.apiService.IssueStatus(memberId.toString());

    if (response.responseCode == 200) {
      bookList =response.data;
      notifyListeners();
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
  }finally {
    isLoading = false;
    notifyListeners();
  }
}


}