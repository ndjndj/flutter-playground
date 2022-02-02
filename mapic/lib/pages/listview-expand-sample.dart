import 'package:flutter/material.dart';

class Item {
  Item(this.title, this.color);

  final String title;
  final Color color;
}

final List<Item> data = <Item>[
  Item('A', Colors.pinkAccent),
  Item('B', Colors.pink),
  Item('C', Colors.redAccent),
  Item('D', Colors.red),
  Item('E', Colors.deepOrangeAccent),
  Item('F', Colors.deepOrange),
  Item('G', Colors.orangeAccent),
  Item('H', Colors.orange),
  Item('I', Colors.amber),
  Item('J', Colors.lime),
  Item('K', Colors.lightGreenAccent),
  Item('L', Colors.lightGreen),
  Item('M', Colors.greenAccent),
  Item('N', Colors.green),
  Item('O', Colors.tealAccent),
  Item('P', Colors.teal),
  Item('Q', Colors.cyanAccent),
  Item('R', Colors.cyan),
  Item('S', Colors.lightBlue),
  Item('T', Colors.blue),
  Item('U', Colors.indigoAccent),
  Item('V', Colors.indigo),
  Item('W', Colors.purpleAccent),
  Item('X', Colors.purple),
  Item('Y', Colors.deepPurple),
  Item('Z', Colors.blueGrey),
];
