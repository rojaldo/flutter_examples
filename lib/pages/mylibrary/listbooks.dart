import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/book.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  _ListBooksState createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  List<Book> _books = [];
  //
  Future<http.Response> _fetchData(String url) {
    return http.get(Uri.parse(url));
  }

  _getBooks() {
    String url = 'http://localhost:8080/api/v0/books';
    _fetchData(url).then((response) {
      dynamic beers = jsonDecode(response.body);
      beers.forEach((json) {
        Book book = Book.fromJson(json);
        _books.add(book);
      });
      setState(() {});
    });
  }

  Widget _listBooks() {
    if (_books.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_books[index].title),
              subtitle: Text(_books[index].author),
              trailing: Text(_books[index].id.toString()),
              onTap: () {
                print(_books[index].toString());
              },
            ),
          );
        },
      );
    }
  }

  @override
  void didUpdateWidget(covariant ListBooks oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    _getBooks();
  }

  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: _listBooks(),
    );
  }
}
