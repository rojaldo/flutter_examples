import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/qr/qrviewexample.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  _onClicked() {
    // go to qrviewexample
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const QRViewExample(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => _onClicked(), child: Text('QR')),
      ),
    );
  }
}
