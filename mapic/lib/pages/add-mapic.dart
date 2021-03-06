import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
  String? _imagePath;
  String? _imageName;

  final picker = ImagePicker();

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile == null) return;

      setState(() {
        this._image = File(pickedFile.path);
        this._imagePath = pickedFile.path;
      });
    } on PlatformException catch(e) {
      print('failed to pick image $e');
    }

  }
  Future getImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return;

      setState(() {
        this._image = File(pickedFile.path);
      });
    } on PlatformException catch(e) {
      print('failed to pick image $e');
    }
  }

  static Future get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<void> _takePhoto() async {
    if ( this._image == null ) return;

    setState(() {
        _imageName = basename(this._imagePath!);
      });

    final path = await localPath;
    final imagePath = '$path/$_imageName';
    File imageFile = File(imagePath);

    await imageFile.writeAsBytes(await _image!.readAsBytes());
    print("imagePath");
    print(imagePath);
  }

  Future<void> _addSnapshot() async {
    await _takePhoto();

    if (_imageName == null) return;

    await SnapShot.createSnapshot(
      _placeController.text,
      _imageName!,
      _addressController.text,
      null,
      null,
      null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('AddMapic')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,

                      ),
                      onPressed: getImageFromGallery,
                      child: Text('gallery', style: TextStyle(color: Colors.white))
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal
                      ),
                      onPressed: getImage,
                      child: Text('camera', style: TextStyle(color: Colors.white))
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageFromGallery,
        child: Icon(Icons.perm_media),
      ),

    );
  }
}
