import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/apod.dart';

class ApodWidget extends StatefulWidget {
  const ApodWidget({Key? key}) : super(key: key);

  @override
  _ApodWidgetState createState() => _ApodWidgetState();
}

class _ApodWidgetState extends State<ApodWidget> {
  String _code = '';
  Apod _apod = Apod();
  dynamic _selectedDate = DateTime.now();

  Future<http.Response> _fetchData(String url) {
    return http.get(Uri.parse(url));
  }

  void _getApod([dateString = '']) {
    String key = 'DEMO_KEY';
    String url =
        'https://api.nasa.gov/planetary/apod?api_key=$key&date=$dateString';
    _fetchData(url).then((response) {
      setState(() {
        _code = response.statusCode.toString();
        _apod = Apod.fromJson(jsonDecode(response.body));
      });
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1995, 6, 15),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _getApod(pickedDate.toString().substring(0, 10));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getApod();
  }

  Widget _showMedia() {
    if (_apod.isImage) {
      return Image.network(_apod.url);
    } else if (_apod.isVideo) {
      return const Text('Video');
    } else {
      return const Text('Unknown');
    }
  }

  Widget _apodStructure() {
    if (_apod.isEmpty()) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: Text(_apod.title),
                    subtitle: Text(_apod.date.toString()),
                  ),
                  _showMedia(),
                  Text(_apod.explanation),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _apodStructure();
  }
}
