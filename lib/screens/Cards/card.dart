import 'package:flutter/material.dart';
import 'package:project/screens/Cards/cardPage.dart';

class Book extends StatefulWidget {
  final List<dynamic> books;
  final int index;

  const Book({Key? key, required this.books, required this.index}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  late String title;
  late String imageLink; 

  void initState() {
    super.initState();
     var volumeInfo = widget.books[widget.index]['volumeInfo'];
    title = volumeInfo['title'].toString();
    imageLink = volumeInfo['imageLinks']['thumbnail'];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CardPage(books: widget.books, index: widget.index)),
  );
      },
      child: Card(
        color: Color.fromARGB(255, 241, 225, 240),
        child: Container(
          width: 150,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(
                imageLink,
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
