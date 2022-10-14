import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewBook extends StatefulWidget {
  const NewBook({Key? key}) : super(key: key);

  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _authorController = TextEditingController();
  }

  _sendBook(BuildContext context) {
    // get the values from the text fields

    // send the values to the server
    String url = 'http://localhost:8080/api/v0/books';
    http.post(Uri.parse(url), body: {
      'title': _titleController.text,
      'author': _authorController.text,
    }).then((response) {
      if (response.statusCode == 201) {
        // show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Book added'),
        ));
      } else {
        // show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error adding book'),
        ));
      }
    });
    // go back to the previous page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Book'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(
                labelText: 'Author',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendBook(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
