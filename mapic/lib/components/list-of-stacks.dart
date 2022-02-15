import 'package:flutter/material.dart';
import '../components/expandable-card.dart';
import '../db/snapshot.dart';
class ListOfStacks extends StatefulWidget {
  @override
  _ListOfStacks createState() => _ListOfStacks();
}

class _ListOfStacks extends State<ListOfStacks> {
  int cardList = 6;

List<Map<String, dynamic>> addressList = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    final data = await SnapShot.getSnapshots();
    setState(() {
      addressList = data;
    });
  }
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
