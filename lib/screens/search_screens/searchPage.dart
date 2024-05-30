import 'package:flutter/material.dart';
import 'package:project/screens/search_screens/searchResults.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search By Category"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 169, 52, 156),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Enter A Category',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResults(category: myController.text),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:Color.fromARGB(255, 158, 149, 157),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
