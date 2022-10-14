import 'package:flutter/material.dart';

import 'listbooks.dart';
import 'newbook.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  _gotoAddBook(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewBook(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: const ListBooks(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _gotoAddBook(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
