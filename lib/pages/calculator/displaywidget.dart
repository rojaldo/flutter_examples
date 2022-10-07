import 'package:flutter/material.dart';

class Displaywidget extends StatelessWidget {
    String _display = '';
Displaywidget({ Key? key, String display = ''}) : super(key: key){
    this._display = display;
}



  @override
  Widget build(BuildContext context){
    return 
    Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_display",
              style: TextStyle(
                fontSize: 25
              )
            )
                      ],
        );

  }
}