import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/Controller/BookListController.dart';
import 'package:provider/provider.dart';

import '../Model/BookModel.dart';
import 'BookDetailsScreen.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider =
    Provider.of<BookListController>(context, listen: false);
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
  final BookModel book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book: book),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 3,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("http://192.168.213.209/lmswebapp/"+book.bookImage, // Book image from API
              width: 60,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.image_not_supported, size: 60),
            ),
          ),
          title: Text(
            book.bname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Author: ${book.authName}",
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
