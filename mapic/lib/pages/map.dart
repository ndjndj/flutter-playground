import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(child: Text('map')),
    );
  }
}
