import 'package:flutter/material.dart';
import '../components/expandable-card.dart';
import '../components/inherited-wrapper.dart';
class ListOfStacks extends StatefulWidget {
  @override
  _ListOfStacks createState() => _ListOfStacks();
}

class _ListOfStacks extends State<ListOfStacks> {
  int cardList = 6;


  @override
  Widget build(BuildContext context) {
    //final indexKey = GlobalObjectKey<ExpandableCard>(context);
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ExpandableCard();
      }
    );
  }
}
