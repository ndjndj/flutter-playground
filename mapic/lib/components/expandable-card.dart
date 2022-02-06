import 'package:flutter/material.dart';


class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  //AnimationController _controller;
  double _height = 200;
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
    });
  }


  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap(),
      child: Card(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 200,
          height: 200,
          color: Colors.blue
        ),
      )
    );

  }

}
