import 'package:flutter/material.dart';
import 'package:lmsapp/Controller/LoginController.dart';
import 'package:lmsapp/Splashscreen.dart';
import 'package:lmsapp/View/ForgotPasswordScreen.dart';
import 'package:lmsapp/View/SignUpScreen.dart';
import 'package:provider/provider.dart';

import 'Controller/SingupController.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp(),
   /* ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),*/
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SingupController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/forgotPassword': (context) => ForgotPasswordScreen(),
          '/signUp': (context) => SignUpScreen(),
        },
      ),
    );
  }
}