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
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 150.0,
            left: 0.0,
            right: 0.0,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 3.0,
              color: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Container(width: double.infinity, height: 200.0)
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 0.0,
            right: 0.0,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 3.0,
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Container(width: double.infinity, height: 200.0)
            ),
          ),
          Positioned(
            bottom: -50.0,
            left: 0.0,
            right: 0.0,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 3.0,
              color: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Container(width: double.infinity, height: 200.0)
            ),
          ),
        ],
      ),
    );
  }
}
