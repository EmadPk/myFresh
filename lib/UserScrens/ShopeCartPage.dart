import 'package:flutter/material.dart';

class ShopeCart extends StatefulWidget {
  @override
  _ShopeCartState createState() => _ShopeCartState();
}

class _ShopeCartState extends State<ShopeCart> {
  var defColor = Color(0xff40a8c4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: defColor,
          ),
          preferredSize: Size.fromHeight(1)),
      body: Container(
        child: Center(
          child: Text(
            'Shope Cart Page',
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
