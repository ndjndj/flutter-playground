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
  Color _color = Colors.white;
  double _opacity = 0.2;

  @override
  void initState() {
    _height = 200;
    _color = Colors.white;
    _opacity = 0.2;
  }

  _handleTap() {
    setState(() {
      _height == 600 ? _height = 200 : _height = 600;
      _opacity == 0.2 ? _opacity = 1.0 : _opacity = 0.2;
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
                image: DecorationImage(
                  image: Image.asset('images/sample2.png').image,
                  fit: BoxFit.fitWidth,
                  opacity: _opacity
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 10.0,
              right: 10.0,
              bottom: 0.0,
              child: Text("ssss")
            ),
            Text("ssss"),
            Text("ssss"),
          ],
        ),
      ),
    );
  }
}
