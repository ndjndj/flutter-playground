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
    refresh();
  }

  void refresh() async {
    final data = await SnapShot.getSnapshots();
    setState(() {
      addressList = data;
    });
    print(addressList);
  }

  @override
  Widget build(BuildContext context) {
    //final indexKey = GlobalObjectKey<ExpandableCard>(context);
    return ListView.builder(
      itemCount: addressList.length,
      itemBuilder: (context, index) => ExpandableCard(
        id: addressList[index]['id'],
        place: addressList[index]['place'],
        imageName: addressList[index]['imagename'],
        reflesh: refresh,
      ),
    );
  }
}
