import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/Controller/BookListController.dart';
import 'package:lmsapp/Model/IssueModel.dart';
import 'package:provider/provider.dart';

import '../Controller/RequestListController.dart';
import '../Model/BookModel.dart';
import 'BookDetailsScreen.dart';

class Requestist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider =
    Provider.of<RequestListController>(context, listen: false);
    countryProvider.getStateList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: countryProvider.isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading
          : ListView.builder(
        itemCount: countryProvider.bookList.length,
        itemBuilder: (context, index) {
          final book = countryProvider.bookList[index];
          return BookItem(book: book);
        },
      ),
    );
  }
}

class BookItem extends StatelessWidget{
  final IssueModel book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book: book),
          ),
        );*/
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 3,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset("assets/image/library.png", // Book image from API
              width: 60,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.image_not_supported, size: 60),
            ),
          ),
          title: Text(
            book.bookname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Author: ${book.publisherid}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              Text("Publisher: ${book.publisherName}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }
}
