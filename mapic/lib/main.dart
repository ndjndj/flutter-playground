import 'package:flutter/material.dart';
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
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image selected.');
      }
    });
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
            TextField(
              onChanged: (String value) {setState(() {_text = value;});}
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
