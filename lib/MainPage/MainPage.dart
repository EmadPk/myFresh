import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/UserScrens/HomePage.dart';
import 'package:my_fresh/UserScrens/MorePage.dart';
import 'package:my_fresh/UserScrens/RecipesPage.dart';
import 'package:my_fresh/UserScrens/SectionsPage.dart';
import 'package:my_fresh/UserScrens/ShopeCartPage.dart';

class HomePage extends StatefulWidget {
  static const RouteName ='/HomePage' ;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var defColor = Color(0xff40a8c4);
  int _currentIndex = 4;


  // ignore: non_constant_identifier_names
  final List <Widget> _Pages =[
    More(),
    Recipec(),
    ShopeCart(),
    Sections(),
    Home(),
  ];


  void _changeIndex(int val) {
    setState(
          () {
        _currentIndex = val;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: defColor,
          currentIndex: _currentIndex,
          onTap: _changeIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedFontSize: 14,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Container(child: Icon(Icons.format_list_bulleted),),
              // ignore: deprecated_member_use
              title: Text('المزيد'),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.receipt),
              title: Text('وصفات'),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Icon(Icons.shopping_cart),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 6,
                    child: Text(
                      '${0}',
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
              title: Text('السله'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              title: Text('أقسام'),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: Text('الرئيسيه'),
            ),
          ],
        ),
      ),
    );
  }
}



/*


 */

