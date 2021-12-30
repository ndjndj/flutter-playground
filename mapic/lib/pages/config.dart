import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  List<String> _configList = [
    'public setting',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Config'),
      ),
      body: ListView.builder(
        itemCount: _configList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_configList[index])
            )
          );
        }
      )
    );
  }
}
