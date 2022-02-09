import 'package:flutter/material.dart';


class ExpandableCard extends StatefulWidget {
  ExpandableCard({Key? key, this.top, this.index}) : super(key: key);
  final double? top;
  final int? index;

  @override
  _ExpandableCard createState() => _ExpandableCard();
}

class _ExpandableCard extends State<ExpandableCard> {
  double _height = 200;
  Color _color = Colors.blue;

  @override
  void initState() {
    _height = 200;
    _color = Colors.blue;
  }

  _handleTap() {
    setState(() {
      _height == 400 ? _height = 200 : _height = 400;
      _color == Colors.blue ? _color = Colors.red : _color =  Colors.blue;
    });

  }

  Widget build(BuildContext context) {
    int? index = widget.index;
    return GestureDetector(
      onTap: () async {
        print('ontap');
        await _handleTap();

      },
      behavior: HitTestBehavior.opaque,
      child: Card(
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0))
          ),
          margin: EdgeInsets.zero,
          elevation: 3.0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: double.infinity,
            height: _height,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
              color: _color
            ),
          ),
        ),
      
    );
  }
}
