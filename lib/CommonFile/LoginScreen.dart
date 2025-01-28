

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image : DecorationImage(
              image:AssetImage('assets/image/bg.png'),
            fit: BoxFit.cover
          ),
        ),

      ),
    );
  }

}