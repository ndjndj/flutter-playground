import 'package:flutter/material.dart';

class CheckDialog extends StatefulWidget {

  @override
  _CheckDialog createState() => _CheckDialog();
}

class _CheckDialog extends State<CheckDialog>{

  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('dialog'),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text('cancel'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('ok'),
        ),
      ],
    );
  }
}
