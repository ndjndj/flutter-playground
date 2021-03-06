import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import './pages/create-user.dart';
import './pages/add-mapic.dart';
import './pages/mapic-list.dart';
import './pages/config.dart';
import './pages/album.dart';
import './pages/map.dart';

void main() {

  runApp(
    new MaterialApp(
      home: Mapic()
    )
  );
}

class Mapic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapic',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Top(),
    );
  }
}

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  List<String> addressList = [];
  int _screenIndex = 0;

  static List<Widget> _pageList = [
    MapicList(),
    Album(),
    AddMapic(),
    Config(),
  ];

  List<BottomNavigationBarItem> bottomNavBar() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'List'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Album'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.miscellaneous_services),
        label: 'Config'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_screenIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {_screenIndex = index;});
        },
        items: bottomNavBar()
      ),
    );
  }
}
