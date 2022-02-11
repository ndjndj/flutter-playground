import 'package:flutter/material.dart';
import '../components/expandable-card.dart';
import '../components/inherited-wrapper.dart';
class ListOfStacks extends StatefulWidget {
  @override
  _ListOfStacks createState() => _ListOfStacks();
}

class _ListOfStacks extends State<ListOfStacks> {

   List<Widget> cardList = <Widget>[
    Positioned(
      top: 300.0,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(index: 0))
    ,
    Positioned(
      top: 150.0,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(index: 1))
    ,
    Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: ExpandableCard(index: 2))
    ,
  ];
  List<bool> selectedList = [];

  //call from expandable-card
  void detectSelectedIndex(index) async {
    setState(() {
      //init
      selectedList = List.filled(cardList.length, false);
      selectedList[index] = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    final indexKey = GlobalObjectKey(context);
    return InheritedWrapper(
      child: Stack(
          children: cardList,
      ),
      fnc: detectSelectedIndex
    );
  }
}
