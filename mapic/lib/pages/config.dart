import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  List<Map<String, Object>> _configList = [
    {
      'name': 'public setting',
      'current': true,
    },
    {
      'name': 'theme',
      'current': true,
    },
    {
      'name': 'initial view',
      'current': true,
    },
    {
      'name': 'logout',
      'current': true,
    },
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
