import 'package:flutter/material.dart';


class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this);
  }

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


}
