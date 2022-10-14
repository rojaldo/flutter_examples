import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/beer.dart';

class BeersWidget extends StatefulWidget {
  const BeersWidget({Key? key}) : super(key: key);

  @override
  _BeersWidgetState createState() => _BeersWidgetState();
}

class _BeersWidgetState extends State<BeersWidget> {
  List<Beer> _beers = [];
  //
  Future<http.Response> _fetchData(String url) {
    return http.get(Uri.parse(url));
  }

  _getBeers() {
    String url = 'https://api.punkapi.com/v2/beers';
    _fetchData(url).then((response) {
      dynamic beers = jsonDecode(response.body);
      beers.forEach((json) {
        Beer beer = Beer.fromJson(json);
        _beers.add(beer);
      });
      setState(() {});
    });
  }

  Widget _listBeers() {
    if (_beers.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _beers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(_beers[index].imageUrl),
              title: Text(_beers[index].name),
              subtitle: Text(_beers[index].tagline),
              trailing: Text(_beers[index].abv.toString()),
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getBeers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: _listBeers(),
    );
  }
}
