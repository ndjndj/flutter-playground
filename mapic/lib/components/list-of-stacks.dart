import 'package:flutter/material.dart';

class ListOfStacks extends StatefulWidget {
  @override
  _ListOfStacks createState() => _ListOfStacks();
}

class _ListOfStacks extends State<ListOfStacks> {
   List<Widget> cardList = <Widget>[
    Positioned(
      top: 300,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(),
    ),
    Positioned(
      top: 150,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(),
    ),
    Positioned(
      top: 0,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(),
    )
  ];

  @override
  Widget build(BuildContext context) {

  }
}
