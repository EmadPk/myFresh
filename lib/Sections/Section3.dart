import 'package:flutter/material.dart';

class Section3 extends StatefulWidget {
  @override
  _Section3State createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Section 3',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
