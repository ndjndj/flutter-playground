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
        itemBuilder: (BuildContext context, int index) => Card(
          child: Padding(
            padding: EdgeInsets.only(top: 36.0, left: 6.0, right: 6.0),
            child: ExpansionTile(
              title: Text('Birth'),
              children: <Widget>[
                Text('test text1'),
                Text('test text2'),
                Text('test text3'),
              ],
            ),
          ),
        )
      )
    );
  }
}
