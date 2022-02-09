import 'package:flutter/material.dart';
import '../components/expandable-card.dart';
import '../components/inherited-wrapper.dart';
class ListOfStacks extends StatefulWidget {
  @override
  _ListOfStacks createState() => _ListOfStacks();
}

class _ListOfStacks extends State<ListOfStacks> {

   List<Widget> cardList = <Widget>[
    ExpandableCard(top: 300, index: 0),
    ExpandableCard(top: 150, index: 1),
    ExpandableCard(top: 0, index: 2),
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
    return InheritedWrapper(
      child: Stack(
          children: cardList,
      ),
      fnc: detectSelectedIndex
    );
  }
}
