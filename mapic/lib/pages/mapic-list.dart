import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../db/snapshot.dart';

class MapicList extends StatefulWidget {
  @override
  _MapicList createState() => _MapicList();
}

class _MapicList extends State<MapicList> {
  List<Map<String, dynamic>> addressList = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    final data = await SnapShot.getSnapshots();
    setState(() {
      addressList = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapic'),
      ),
      body: ListView.builder(
        itemCount: addressList.length,
        itemBuilder: (BuildContext context, int index) => ExpansionTile(
          title: addressList[index]['place'],
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blue,
            )
          ],
        ),
      )
    );
  }
}
