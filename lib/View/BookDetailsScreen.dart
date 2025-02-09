
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/Model/BookModel.dart';
import 'package:provider/provider.dart';

import '../Controller/IssueController.dart';

class BookDetailsScreen extends StatelessWidget{

  final BookModel book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    final countryProvider =
    Provider.of<IssueController>(context, listen: false);
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
                child: Image.network(
                  "http://192.168.213.209/lmswebapp/"+book.bookImage, // Static image
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
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Text("Author:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(width: 32),
                  Text(book.authName,
                      style: TextStyle(fontSize: 20, color: Colors.blue[700])),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Text("Publisher:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(width: 18),
                  Text(book.publisherName,
                      style: TextStyle(fontSize: 20, color: Colors.blue[700])),
                ],
              ),
            ),
            SizedBox(height: 0),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Text("Gener:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(width: 40),
                  Text(book.generId,
                      style: TextStyle(fontSize: 20, color: Colors.blue[700])),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
                  "No description available.", // Add description field in Book model
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  countryProvider.IssueRequest(book);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Request Issue", style: TextStyle(fontSize: 18,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}