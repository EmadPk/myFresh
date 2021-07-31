import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/Sections/Section1.dart';
import 'package:my_fresh/Sections/Section2.dart';
import 'package:my_fresh/Sections/Section3.dart';
import 'package:my_fresh/Sections/Section4.dart';
import 'package:my_fresh/Sections/Section5.dart';
import 'package:my_fresh/Sections/Section6.dart';
import 'package:my_fresh/Sections/Section7.dart';
import 'package:my_fresh/Sections/Section8.dart';
import 'package:my_fresh/Sections/Section9.dart';
import 'package:url_launcher/url_launcher.dart';

class Sections extends StatefulWidget {
  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(
      length: 9,
      vsync: this,
      initialIndex: 1,
    );
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  var defColor = Color(0xff40a8c4);
  get primary => Colors.red;

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('cant Launch $command');
    }
  }

  // ignore: non_constant_identifier_names
  final List<Widget> Pages = <Widget>[
    Section1(),
    Section2(),
    Section3(),
    Section4(),
    Section5(),
    Section6(),
    Section7(),
    Section8(),
    Section9(),
  ];

  // List <dynamic> menuItems = [
  //   'فواكه',
  //   ' سلة الفواكه',
  //   'خضروات  ',
  //   'خضروات جاهزة  ',
  //   'دواجن وبيض  ',
  //   'حلويات  ',
  //   ' بـقـالـه',
  //   'عطارة',
  //   'عروض اليوم',
  // ];

  final List<Tab> tabs = <Tab>[
    Tab(
      text: 'فواكه',
    ),
    Tab(
      text: ' سلة الفواكه',
    ),
    Tab(
      text: 'خضروات  ',
    ),
    Tab(
      text: 'خضروات جاهزة  ',
    ),
    Tab(
      text: 'دواجن وبيض  ',
    ),
    Tab(
      text: 'حلويات  ',
    ),
    Tab(
      text: ' بـقـالـه',
    ),
    Tab(
      text: '  عطارة  ',
    ),
    Tab(
      text: 'عروض اليوم',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(),
          appBar: AppBar(
            backgroundColor: defColor,
            actions: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fresco',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: new Container(
                color: Colors.white,
                child: new TabBar(
                  // controller: tabController,
                  labelStyle: TextStyle(fontSize: 25),
                  indicatorColor: Colors.red,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black87,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
          ),
          body: Container(
            child: TabBarView(
              children: Pages.map((Widget data) {
                return data;
              }).toList(),
            ),
          ),
        ));
  }
}

// Container(
//   margin: EdgeInsets.symmetric(vertical: 10),
//   height: 30,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//       itemCount:catigories.length ,
//       itemBuilder: (context,index)=>GestureDetector(
//         onTap: (){
//           setState(() {
//             selctedIndex = index;
//           });
//         },
//         child: Container(
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(left: 20),
//           decoration: BoxDecoration(
//             color: index == selctedIndex ?Colors.white.withOpacity(0.4) : Colors.transparent,
//                 border: Border(bottom: BorderSide(color: Colors.red,width: 3),),
//           ),
//           child: Text(catigories[index],style: TextStyle(color: Colors.blueAccent),),
//         ),
//       ),
//   ),
// )

// Container(
//
//   child: FlatButton(
//     onPressed: () {},
//     child: Text(
//       'Go',
//       style: TextStyle(fontSize: 25),
//     ),
//   ),
//   decoration: BoxDecoration(
//     border: Border(bottom: BorderSide(color: Colors.red,width: 3)),
//   ),
// ),
// FlatButton(
//   onPressed: (){},
//   child: Text(
//     'Go',
//     style: TextStyle(fontSize: 25),
//   ),
//   shape: new RoundedRectangleBorder(
//       borderRadius: new BorderRadius.circular(30.0)),
// ),
// FlatButton(
//   color: Colors.red,
//   textColor: Colors.green,
//   hoverColor: Colors.blue,
//   splashColor: Colors.black,
//   disabledColor: Colors.teal,
//   highlightColor: Colors.yellowAccent,
//   onPressed: () {
//     setState(
//       () {
//         print('hello');
//       },
//     );
//   },
//   child: Text(
//     'go',
//     style: TextStyle(
//       fontSize: 30,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// ),

// Center(
//   child: Text(
//     'SectionPage',
//     style: TextStyle(color: Colors.red, fontSize: 50),
//   ),
// ),
