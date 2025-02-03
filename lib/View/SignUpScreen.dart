import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/SingupController.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider =
        Provider.of<SingupController>(context, listen: false);
    countryProvider.getCountryList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/bg.png'),
                    fit: BoxFit.cover)),
            child: Column(children: [
              SizedBox(height: 0),
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.UsernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.PasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.EmailController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Contact Number',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.ContactNumberController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'DOB',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final controller = Provider.of<SingupController>(context, listen: false);
                          controller.pickDate(context);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Consumer<SingupController>(
                            builder: (context, controller, child) {
                              return Text(
                                controller.DobController.text.isEmpty
                                    ? 'Select DOB'
                                    : controller.DobController.text,
                                style: TextStyle(color: Colors.black54),
                              );
                            },
                          ),
                        ),
                      ),
                      /* TextField(
                        //   controller: loginScreenViewModel.passController,
                        obscureText:true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),*/
                      SizedBox(height: 10),
                      Text(
                        'Country',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showSelectionDialog(
                            context: context,
                            title: "Select a Country",
                            items: countryProvider.countries,
                            getDisplayName: (country) => country.CountryName,
                            onItemSelected: (country) {
                              countryProvider.selectCountry(
                                  country.CountryName, country.CountryId);
                            }),
                        child: TextField(
                          controller: countryProvider.countryController,
                          enabled: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1), // Default border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2), // Border when focused
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'State',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showSelectionDialog(
                            context: context,
                            title: "Select a State",
                            items: countryProvider.state,
                            getDisplayName: (state) => state.stateName,
                            onItemSelected: (state) {
                              countryProvider.selectState(
                                  state.stateName, state.stateId);
                            }),
                        child: TextField(
                          controller: countryProvider.stateController,
                          enabled: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1), // Default border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2), // Border when focused
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'City',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.CityController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pin Code',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.PinCodeController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF206ADA),
                        ),
                      ),
                      TextField(
                        controller: countryProvider.AddressController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2), // Border when focused
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          countryProvider.RegisterUser();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Powered By:',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Adi Infotech Pvt. Ltd.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ])));
  }

  /*void _showCountryDialog(BuildContext context) {
    debugPrint("HELLO");
    showDialog(
      context: context,
      builder: (context) {
        return Consumer<SingupController>(
          builder: (context, countryProvider, child) {
            return AlertDialog(
              title: Text('Select a Country'),
              content: countryProvider.countries.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: countryProvider.countries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(countryProvider.countries[index].CountryName),
                      onTap: () {
                        countryProvider.selectCountry(
                            countryProvider.countries[index].CountryName,countryProvider.countries[index].CountryId);
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    );
                  },
                ),
              ),

            );
          },
        );
      },
    );
  }*/

  void _showSelectionDialog<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) getDisplayName,
    required void Function(T) onItemSelected,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: items.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(getDisplayName(items[index])),
                        onTap: () {
                          onItemSelected(items[index]);
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
