import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../db/snapshot.dart';
import '../components/expandable-card.dart';

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
            top: 300,
            left: 0.0,
            right: 0.0,
            child: ExpandableCard(),
          ),
          Positioned(
            top: 150,
            left: 0.0,
            right: 0.0,
            child: ExpandableCard(),
          ),
          Positioned(
            top: 0,
            left: 0.0,
            right: 0.0,
            child: ExpandableCard(),
          ),

        ],
      )

    );
  }
}
