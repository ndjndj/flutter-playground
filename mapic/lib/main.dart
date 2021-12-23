import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(Mapic());
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddMapicPage();
            })
          );
          if (newText != null) {
            setState(() {
              addressList.add(newText);
            });
          }
        },
        child: Icon(Icons.add)
      ),
    );
  }
}

class AddMapicPage extends StatefulWidget {
  @override
  _AddMapicPageState createState() => _AddMapicPageState();
}

class _AddMapicPageState extends State<AddMapicPage> {
  String _text = '';
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
              onChanged: (String value) {setState(() {_text = value;});}
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue
              ),
              onPressed: () {},
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
