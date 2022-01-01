import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  @override
  _Dropdown createState() => _DropDown();
}

class _Dropdown extends State<Dropdown> {
  String _dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String> (
      value: _dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
