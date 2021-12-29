import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import './pages/create-user.dart';
void main() {

  runApp(
    new MaterialApp(
      home: Top()
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
    CreateUser(),
    AddMapicPage(),
    Top()
  ];

  List<BottomNavigationBarItem> bottomNavBar() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'list'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.miscellaneous_services),
        label: 'config'
      ),
    ];
  }

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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: (index) {
          setState(() {_screenIndex = index;});
        },
        items: bottomNavBar()
      ),
    );
  }
}
