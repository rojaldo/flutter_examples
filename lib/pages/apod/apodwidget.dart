import 'package:flutter/material.dart';
import '../../models/apod.dart';
import '../../models/apod.dart';

class ApodWidget extends StatelessWidget {
  Apod _apod = Apod();
  ApodWidget({Key? key, required Apod myApod}) : super(key: key) {
    _apod = myApod;
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
