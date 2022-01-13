import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../db/snapshot.dart';
import './map.dart';

class AddMapic extends StatefulWidget {
  @override
  _AddMapic createState() => _AddMapic();
}

class _AddMapic extends State<AddMapic> {
  String _place = '';
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile == null) return;

      final imageTmp = File(pickedFile.path);


      setState(() {
        this._image = imageTmp;
      });
    } on PlatformException catch(e) {
      print('failed to pick image $e');
    }

  }

  Future<void> _addSnapshot() async {
    await SnapShot.createSnapshot(_place, null, null, null);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddMapic')
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          children: <Widget>[
            _image != null
              ? Image.file(
                  _image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 160,
                  height: 160,
                  child: Card(
                    child: InkWell(
                      onTap: getImage,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add_a_photo, size: 36),
                          Text('add a photo'),
                        ],
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'place name',
                labelStyle: TextStyle(fontSize: 12),
                hintText: 'lol',
              ),
              onChanged: (String value) {setState(() {_place = value;});}
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'address',
                labelStyle: TextStyle(fontSize: 12),
                hintText: 'Arctic',
                suffixIcon: IconButton(
                      icon: Icon(Icons.place),
                      onPressed: () async {
                        final address = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return Map();
                          })
                        );
                      },
                  ),
              ),
              onChanged: (String value) {setState(() {_place= value;});}
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal
              ),
              onPressed: _addSnapshot,
              child: Text('save', style: TextStyle(color: Colors.white))
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
