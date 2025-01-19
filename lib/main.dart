import 'package:flutter/material.dart';
import 'package:lmsapp/Splashscreen.dart';

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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner : false,
      //  builder: EasyLoading.init(),
        home: SplashScreen()// Set SplashScreen as the initial home
    );
  }
}