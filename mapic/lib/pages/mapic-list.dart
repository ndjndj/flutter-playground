import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../components/expandable-card.dart';
import '../components/inherited-wrapper.dart';
import '../components/list-of-stacks.dart';

class MapicList extends StatefulWidget {
  @override
  _MapicList createState() => _MapicList();
}

class _MapicList extends State<MapicList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Mapic'),
          ),
          body: ListOfStacks()
    );
  }
}
