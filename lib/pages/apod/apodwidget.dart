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

  void _getApod() {
    String key = 'tqz634Z1x0LiJzjbhSyUoExrZaGKLM0MG1VnROR6';
    String url = 'https://api.nasa.gov/planetary/apod?api_key=$key';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Apod: ${_apod.title}'),
    );
  }
}
