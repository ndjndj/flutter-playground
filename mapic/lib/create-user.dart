import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class CreateUser extends StatefulWidget {
  @override
  _CreateUser createState() => _CreateUser();
}

class _CreateUser extends State<CreateUser> {
  //bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(child: Text('create user')),
    );
  }
}
