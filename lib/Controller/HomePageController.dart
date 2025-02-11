
import 'package:flutter/cupertino.dart';

import '../main.dart';

class HomePageController extends ChangeNotifier{

  void onOpenList() {
    // Navigate to Sign Up screen
    navigatorKey.currentState?.pushNamed('/BooKList');
  }

  void onOpenReList() {
    // Navigate to Sign Up screen
    navigatorKey.currentState?.pushNamed('/Request');
  }

}