import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../db/snapshot.dart';
import './map-sample.dart';

class AddMapic extends StatefulWidget {
  @override
  _AddMapic createState() => _AddMapic();
}

class _AddMapic extends State<AddMapic> {
  var _addressController = TextEditingController();
  var _placeController = TextEditingController();

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
    await SnapShot.createSnapshot(_placeController.text, null, null, null, null);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddMapic')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Column(
          children: <Widget>[
            _image != null
              ? ClipRRect(child:
                  Image.file(
                    _image!,
                    width: 280,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                )
              : Container(
                  width: 280,
                  height: 280,
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
              Row(children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal
                  ),
                  onPressed: _addSnapshot,
                  child: Text('save', style: TextStyle(color: Colors.white))
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal
                  ),
                  onPressed: _addSnapshot,
                  child: Text('save', style: TextStyle(color: Colors.white))
                ),
            ]),
            TextField(
              controller: _placeController,
              decoration: InputDecoration(
                labelText: 'place name',
                labelStyle: TextStyle(fontSize: 12),
                hintText: 'lol',
              ),

            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'address',
                labelStyle: TextStyle(fontSize: 12),
                hintText: 'Arctic',
                suffixIcon: IconButton(
                      icon: Icon(Icons.place),
                      onPressed: () async {
                        final address = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return MapSample();
                          })
                        );
                        if (address != null) {
                          setState(() {_addressController.text = address['address'];});
                        }
                      },
                  ),
              ),

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
        onPressed: () {},
        child: Icon(Icons.perm_media),
      ),

    );
  }
}
