import 'package:flutter/material.dart';


class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  //AnimationController _controller;

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

  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 200,
        height: 100,
        color: Colors.blue
      ),
    );
  }

}
