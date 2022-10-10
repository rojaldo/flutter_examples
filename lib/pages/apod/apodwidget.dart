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

  @override
  void initState() {
    super.initState();
    _getApod();
  }

  Widget _apodStructure() {
    if (_apod.isEmpty()) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: Text(_apod.title),
                subtitle: Text(_apod.date.toString()),
              ),
              Image.network(_apod.url),
              Text(_apod.explanation),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _apodStructure();
  }
}
