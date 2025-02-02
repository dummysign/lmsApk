import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsapp/Model/StateModel.dart';
import 'package:lmsapp/Model/countrymodel.dart';

import '../Model/CountryResponse.dart';
import '../Model/StateResponse.dart';
import '../Services/ApiClient.dart';

class SingupController extends ChangeNotifier{
  final ApiClient _apiClient = ApiClient();

  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  List<countrymodel> _countries = [];
  String _selectedCountry = '';

  int _selectedCountryid = 0;


  List<StateModel> _state = [];
  String _selectedstate = '';

  int _selectedstateid = 0;

  List<countrymodel> get countries => _countries;
  String get selectedCountry => _selectedCountry;

  List<StateModel> get state => _state;
  String get selectedState => _selectedstate;

  // Fetch country names from API
  Future<void> getCountryList() async {


    try {
      CountryResponse response = await _apiClient.apiService.getcountries();

      if (response.responseCode == 200) {
        _countries = response.data;
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
    }
  }


  Future<void> getStateList() async {


    try {
      StateResponse response = await _apiClient.apiService.getstate(_selectedCountryid);

      if (response.responseCode == 200) {
        _state = response.datastate;
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
    }
  }



  void selectCountry(String country, int countryId) {
    _selectedCountry = country;
    countryController.text = country;
    _selectedCountryid = countryId;
    getStateList();
    notifyListeners();
  }


  void selectState(String state, int countryId) {
    _selectedstate = state;
    stateController.text = state;
    _selectedstateid = countryId;
    notifyListeners();
  }


}