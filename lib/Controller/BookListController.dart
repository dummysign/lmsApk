

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsapp/Model/BookModel.dart';

import '../Model/BookListResponse.dart';
import '../Services/ApiClient.dart';

class BookListController extends ChangeNotifier{

  final ApiClient _apiClient = ApiClient();
  List<BookModel> bookList = [];
  bool isLoading = true;


  Future<void> getStateList() async {
    try {
      BookListResponse response =
      await _apiClient.apiService.BookList();

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