import 'package:flutter/material.dart';

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
              addressList.add(newText)
            });
          }
        },
        child: Icon(Icons.add)
      ),
    );
  }
}