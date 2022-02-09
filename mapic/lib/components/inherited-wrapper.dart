import 'package:flutter/material.dart';

class InheritedWrapper extends InheritedWidget {
  final Function fnc;
  InheritedWrapper({required this.fnc, required Widget child}) : super(child: child);

  static InheritedWrapper of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedWrapper>() as InheritedWrapper;

  @override
  bool updateShouldNotify(InheritedWrapper oldWidget) => oldWidget.index != index;
}
