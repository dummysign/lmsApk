
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/Model/BookModel.dart';

class BookDetailsScreen extends StatelessWidget{

  final BookModel book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bname),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/image/book.png', // Static image
                  width: 120,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text("Title: ${book.bname}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text("Author: ${book.authid}",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 5),
            Text("Publisher: ${book.publisherid}",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 20),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              book.generId ??
                  "No description available.", // Add description field in Book model
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

}