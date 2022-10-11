import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/apod/apodwidget.dart';

import '../../models/apod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Apodpage extends StatefulWidget {
  const Apodpage({Key? key}) : super(key: key);

  @override
  _ApodpageState createState() => _ApodpageState();
}

class _ApodpageState extends State<Apodpage> {
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
    print(url);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apod Sample'),
        ),
        body: ApodWidget(myApod: _apod),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _selectDate(context),
          tooltip: 'Increment',
          child: const Icon(Icons.calendar_month),
        )); // Scaffold
  }
}
