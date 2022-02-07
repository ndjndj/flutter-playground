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

  List<Widget> cardList = <Widget>[
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
    )
  ];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  changeIndex (int tappedIndex)  async {
    if (tappedIndex == 0) {
      return;
    }

    final tapped = cardList[tappedIndex];
    final preTapped = cardList[tappedIndex - 1];
    setState(() {
      cardList[tappedIndex] = preTapped;
      cardList[tappedIndex - 1] = tapped;
    });

    return;
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
        children: cardList
      )

    );
  }
}
