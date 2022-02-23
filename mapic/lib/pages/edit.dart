import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(child: Text('edit')),
    );
  }
}
