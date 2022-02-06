import 'package:flutter/material.dart';


class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  //AnimationController _controller;
  double _height = 200;
  Color _color = Colors.blue;

  @override
  void initState() {

  }
  /*
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3.0,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0))
      ),
      child: Container(width: double.infinity, height: 200.0)
    );
  }
  */
  _handleTap () {
    setState(() {
      _height == 400 ? _height = 200 : _height = 400;
      _color == Colors.blue ? _color = Colors.red : _color =  Colors.blue;
    });
  }


  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap(),
      child: Card(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 200,
          height: _height,
          color: _color
        ),
      )
    );

  }

}
