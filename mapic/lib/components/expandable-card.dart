import 'package:flutter/material.dart';
import '../components/inherited-wrapper.dart';

class ExpandableCard extends StatefulWidget {
  ExpandableCard({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  double _height = 200;
  Color _color = Colors.blue;

  @override
  void initState() {
    _height = 200;
    _color = Colors.blue;
  }

  _handleTap() {
    setState(() {
      _height == 400 ? _height = 200 : _height = 400;
      _color == Colors.blue ? _color = Colors.red : _color =  Colors.blue;
    });

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
              ),
              child: Image.asset('images/sample.png', fit: BoxFit.contain, height: _height,),
            ),
            Text("ssss"),
            Text("ssss"),
            Text("ssss"),
          ],
        ),
      ),
    );
  }
}
