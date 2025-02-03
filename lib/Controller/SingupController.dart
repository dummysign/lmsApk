import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lmsapp/Model/StateModel.dart';
import 'package:lmsapp/Model/countrymodel.dart';

import '../Model/CountryResponse.dart';
import '../Model/RegisterResponse.dart';
import '../Model/StateResponse.dart';
import '../Services/ApiClient.dart';

class SingupController extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();

  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController ContactNumberController = TextEditingController();
  final TextEditingController DobController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  final TextEditingController PinCodeController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();

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
      StateResponse response =
          await _apiClient.apiService.getstate(_selectedCountryid);

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

  Future<void> RegisterUser() async {
    String name = UsernameController.text.trim();
    String password = PasswordController.text.trim();
    String Email = EmailController.text.trim();
    String Contactnumber = ContactNumberController.text.trim();
    String DateBirth = DobController.text.trim();
    String Cityname = CityController.text.trim();
    String PinCode = PinCodeController.text.trim();
    String Address = AddressController.text.trim();
    String State = stateController.text.trim();
    String Country = countryController.text.trim();

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
    if (Email.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (Contactnumber.isEmpty) {
      Fluttertoast.showToast(
        msg: "Contactnumber Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    if (DateBirth.isEmpty) {
      Fluttertoast.showToast(
        msg: "Date of Birth Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (Cityname.isEmpty) {
      Fluttertoast.showToast(
        msg: "Cityname Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (PinCode.isEmpty) {
      Fluttertoast.showToast(
        msg: "Pin Code Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    if (Address.isEmpty) {
      Fluttertoast.showToast(
        msg: "Address Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (State.isEmpty) {
      Fluttertoast.showToast(
        msg: "State Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (Country.isEmpty) {
      Fluttertoast.showToast(
        msg: "Country Can Not Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    final requestBody = {
      'fullName': name,
      'email': Email,
      'password': password,
      'contactNumber': Contactnumber,
      'dob': DateBirth,
      'country': _selectedCountryid.toString(),
      'state': _selectedstateid.toString(),
      'city': Cityname,
      'pincode': PinCode,
      'address': Address,
    };


    try {
      RegisterResponse response =
      await _apiClient.apiService.signup(requestBody);

      if (response.ResponseCode == 201) {
        Fluttertoast.showToast(
          msg: "Sucesss: ${response.ResponseMessage}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
         UsernameController.text == "";
         PasswordController.text = "";
         EmailController.text = "";
         ContactNumberController.text = "";
         DobController.text= "";
        CityController.text= "";
         PinCodeController.text = "";
         AddressController.text = "";
        stateController.text = "";
        countryController.text = "";
        notifyListeners();
      } else {
        Fluttertoast.showToast(
          msg: "Error: ${response.ResponseMessage}",
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

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the selected date to "yyyy-dd-mm"
      String formattedDate = DateFormat('yyyy-dd-MM').format(pickedDate);
      DobController.text = formattedDate; // Update the text field
      notifyListeners(); // Notify UI of the update
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
