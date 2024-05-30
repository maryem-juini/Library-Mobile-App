import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/screens/Cards/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> categories = [
    'Popular',
    'Fiction',
    'Comedy',
    'Technology',
    'Romance'
  ];
  Map<String, List<dynamic>> categoryBooks = {};

  Future<void> getBookByCategory() async {
    for (String category in categories) {
      var response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=subject:$category'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        categoryBooks[category] = jsonData['items'];
      } else {
        throw Exception('Failed to load data');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Your Library"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 169, 52, 156),
      ),
      body: FutureBuilder(
              future: getBookByCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        String category = categories[index];
                        List<dynamic> books = categoryBooks[category]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Text(category,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:Colors.blue[900]
                              ),),
                            ),
                            Container(
                              height: 200,
                                child: ListView.builder(
                                    itemCount: books.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {

                                      return Book(books: books, index: index);
                                    }))
                          ],
                        );
                      }));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
    );
  }
}