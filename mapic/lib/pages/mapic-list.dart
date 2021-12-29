import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class MapicList extends StatefulWidget {
  @override
  _MapicList createState() => _MapicList();
}

class _MapicList extends State<MapicList> {
  List<String> addressList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapic'),
      ),
      body: ListView.builder(
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(addressList[index])
            )
          );
        },
      ),
    );
  }
}