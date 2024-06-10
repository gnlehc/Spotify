import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  void _performSearch() {
    // Implement your search logic here
    // You can use the _searchQuery to fetch relevant results
    print('Performing search: $_searchQuery');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onSubmitted: (value) {
            _performSearch();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _performSearch,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Search Results Will Appear Here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchScreen(),
  ));
}
