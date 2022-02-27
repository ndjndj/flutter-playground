import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: Center(child: Text('album')),
    );
  }
}
