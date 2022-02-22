import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import '../db/snapshot.dart';
class ExpandableCard extends StatefulWidget {
  final int id;
  final String place;
  final String imageName;
  final Function reflesh;

  ExpandableCard({required this.id, required this.place, required this.imageName, required this.reflesh});

  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  double _height = 110;
  Color _color = Colors.white;
  double _opacity = 0.2;
  double _headOpacity = 0.2;
  bool isOpened = false;
  String _imagePath = '';


  @override
  void initState() {
    isOpened = false;
    _height = 110;
    _color = Colors.white;
    _opacity = 0.2;
    _headOpacity = 0.2;

    _localPath();

    print('initstate');
    print(widget.place);
    print(widget.imageName);
    print(_imagePath);
  }

  void _localPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print('appDocDir.path');
    print(appDocDir.path);
    setState(() {
      _imagePath = appDocDir.path + '/' + widget.imageName;
    });
  }

  _handleTap() {
    setState(() {
      isOpened ? isOpened = false : isOpened = true;
      isOpened ? _height = 500 : _height = 110;
      isOpened ? _opacity = 1.0 : _opacity = 0.2;
      isOpened ? _headOpacity = 1.0 : _headOpacity = 0.2;
    });

  }

  _edit() {
    return;
  }
  _delete() async {
    await SnapShot.deleteSnapshot(widget.id);
    await widget.reflesh();
    return;
  }

  _addAlubum() {
    return;
  }

  _share() {
    return;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('ontap');
        await _handleTap();

      },
      behavior: HitTestBehavior.opaque,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
        elevation: 3.0,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: double.infinity,
              height: _height,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: _color,
                image: DecorationImage(
                  image: Image.file(File(_imagePath)).image,
                  fit: BoxFit.fitWidth,
                  opacity: _opacity
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 105,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_headOpacity)
              ),

            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              right: 10.0,
              bottom: 0.0,
              child: Text(
                "2022/02/02",
                style: TextStyle(
                  fontSize: 16.0,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
            Positioned(
              top: 30.0,
              left: 10.0,
              right: 10.0,
              bottom: 0.0,
              child: Text(
                widget.place,
                style: GoogleFonts.rocknRollOne(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              left: 10.0,
              right: 10.0,
              bottom: 0.0,
              child: Text(
                widget.place,
                style: GoogleFonts.rocknRollOne(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 90.0,
              top: 65.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.book),
                iconSize: 24,

              ),
            ),
            Positioned(
              right: 60.0,
              top: 65.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                iconSize: 24,
              ),
            ),
            Positioned(
              right: 30.0,
              top: 65.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
                iconSize: 24,
              ),
            ),
            Positioned(
              right: 0.0,
              top: 65.0,
              child: IconButton(
                onPressed: _delete,
                icon: Icon(Icons.delete),
                iconSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
