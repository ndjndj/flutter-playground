import 'package:flutter/material.dart';

void main() {
  runApp(Mapic());
}

class Mapic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapic',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Top(),
    );
  }
}

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}
