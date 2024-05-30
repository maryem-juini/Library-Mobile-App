import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/screens/Cards/card.dart';

class SearchResults extends StatefulWidget {
  final String category;

  const SearchResults({Key? key, required this.category}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  Map<String, List<dynamic>> categoryBooks = {};

  Future<void> getBookByCategory() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://www.googleapis.com/books/v1/volumes?q=subject:${widget.category}'),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        categoryBooks[widget.category] = jsonData['items'];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books in ${widget.category}"),
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 169, 52, 156)
      ),
      body: FutureBuilder(
        future: getBookByCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
              String category = widget.category;
              List<dynamic> books = categoryBooks[category]!;
              return Center(
                child: Container(
                  width: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Book(books: books, index: index);
                    },
                  ),
                ),
              );
            }
           else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        },
      ),
    );
  }
}
