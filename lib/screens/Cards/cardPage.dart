import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final List<dynamic> books;
  final int index;
  const CardPage({super.key, required this.books, required this.index});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late String title;
  late String imageLink;
  late String description;
  late List<dynamic> authors;
  late Color _favIconColor;

  void initState() {
    super.initState();
    var volumeInfo = widget.books[widget.index]['volumeInfo'];
    title = volumeInfo['title'].toString();
    imageLink = volumeInfo['imageLinks']['thumbnail'];
    description = volumeInfo['description'];
    authors = volumeInfo['authors'];
    _favIconColor = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Book"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 169, 52, 156),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: _favIconColor,
                      tooltip: 'Add to favorite',
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          if (_favIconColor == Colors.grey) {
                            _favIconColor = Colors.red;
                          } else {
                            _favIconColor = Colors.grey;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.network(
                imageLink,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Author :",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 1, 61, 111),
                    decoration: TextDecoration.none),
              ),
              Text(
                authors[0],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description :",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 1, 61, 111),
                    decoration: TextDecoration.none),
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
