import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  List<Map<String, dynamic>> _configList = [
    {
      'name': 'public setting',
      'current': 'myself',
      'type': 'radio',
      'items': ['myself', 'friedns', 'community', 'other']
    },
    {
      'name': 'theme',
      'current': 'null',
      'type': 'transition',
      'items': '.dart'
    },
    {
      'name': 'initial view',
      'current': 'config',
      'type': 'select',
      'items': ['Add', 'List']
    },
    {
      'name': 'logout',
      'current': 'null',
      'type': 'do',
      'items': 'null'
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
              title: Text(_configList[index]['name'])
            )
          );
        }
      ),
    );
  }
}
