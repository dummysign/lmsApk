import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/HomePageController.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<HomePageController>(context, listen: false).onOpenList();
                        },
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Book List',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/image/library.png",
                                  width: 50,
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Provider.of<HomePageController>(context, listen: false).onOpenReList();
                        },
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Request List',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/image/monitor.png",
                                  width: 50,
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
