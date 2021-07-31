import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/Sections/Section1.dart';
import 'package:my_fresh/Sections/Section2.dart';
import 'package:url_launcher/url_launcher.dart';

class Recipec extends StatefulWidget {
  @override
  _RecipecState createState() => _RecipecState();
}

class _RecipecState extends State<Recipec> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var defColor = Color(0xff40a8c4);

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('cant Launch $command');
    }
  }

  int bodyNum = 1;
  List<Widget> none = <Widget>[
    Section1(),
    Section2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea( 
          child: Column(
            children: [
              Container (
                width: double.infinity,
                child: Text('llllllllllllll'),
              ),
              Text('nnnnnnnnmmmmmmmmmmmmmmnnnn'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      customLaunch('tel:01093692111');
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: null),
                ],
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'Fresco',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Flexible(
          //   flex: 2,
          //   fit: FlexFit.tight,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.menu),
          //         onPressed: () {
          //           _scaffoldKey.currentState.openEndDrawer();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
        backgroundColor: defColor,
      ),
      body: Center(
        child: Text(
          'Recipes Page',
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
