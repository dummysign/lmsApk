import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/LoginController.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginScreenViewModel = Provider.of<LoginController>(context);
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/bg.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 70),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Image.asset(
                      'assets/image/books.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'popsmibold',
                                color: Color(0xFF206ADA),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF206ADA),
                            ),
                          ),
                          TextField(
                           // controller: loginScreenViewModel.nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.grey, width: 1)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 1), // Default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 2), // Border when focused
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF206ADA),
                            ),
                          ),
                          TextField(
                         //   controller: loginScreenViewModel.passController,
                            obscureText:true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.grey, width: 1)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 1), // Default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 2), // Border when focused
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: (){
                            //  loginScreenViewModel.login(context,loginScreenViewModel.nameController.text,loginScreenViewModel.passController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            child: Center(
                              child:  Text(
                                'Proceed',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Call the method from LoginController to handle Sign Up
                                  Provider.of<LoginController>(context, listen: false).onForgotPassword();
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontFamily:'popsmibold' ,
                                    fontSize: 18,
                                    color: Color(0xFF206ADA),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Provider.of<LoginController>(context, listen: false).onSignUp();
                                },
                                child: Text(
                                  'Sing Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily:'popsmibold' ,
                                    color: Color(0xFF206ADA),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 120),
                          Center(
                            child:Column(
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
                  )
              )
            ],
          )
      ),
    );
  }

}