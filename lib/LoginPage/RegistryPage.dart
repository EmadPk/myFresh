import 'package:flutter/material.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({Key? key}) : super(key: key);

  static const RouteName = '/registryPage';

  @override
  _RegistryPageState createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Enter your phone number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              TextField(),
            ],
          )
        ],
      ),
    );
  }
}
