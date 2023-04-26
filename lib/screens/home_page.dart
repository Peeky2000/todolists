import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
      ),
      body: Container(
        child: const Text("This is home screen"),
      ),
    );
  }
}
