import 'package:flutter/material.dart';.


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ), body: Center(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
            'Main Screen Content', children: <Widget>[ Text(
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),.
      // Add other widgets for your Main Screen here.
      ],
    ),
    ), ),
    ); )
  }
}