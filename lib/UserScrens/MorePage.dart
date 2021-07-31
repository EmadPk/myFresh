import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  var defColor = Color(0xff40a8c4);
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('cant Launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: defColor,
          ),
          preferredSize: Size.fromHeight(1)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .35,
              image: AssetImage('images/fresco.png'),
              fit: BoxFit.fill,
            ),
            // Container(
            //   width: double.infinity,
            //   // width: double.infinity,
            //   child: Image.asset('images/fresco.png'),
            // ),
            ListTile(
              trailing: Icon(
                Icons.comment,
                size: 30,
                color: Colors.yellow[800],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'عن التطبيق  ',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.share,
                size: 30,
                color: Colors.yellow[800],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'مشاركة التطبيق ',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              onTap: () {
                Share.share('im Wait The URL From App Store');
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.phone,
                size: 30,
                color: Colors.yellow[800],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '01093692111',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              onTap: () {
                customLaunch('tel:+201093692111');
              },
            ),
          ],
        ),
      ),
    );
  }
}
