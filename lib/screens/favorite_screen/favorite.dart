import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  final String books;
  const Favorites({super.key, required this.books});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your favorite books"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 169, 52, 156),
      ),
    );
  }
}