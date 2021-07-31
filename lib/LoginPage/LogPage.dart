import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/LoginPage/RegistryPage.dart';
import 'package:my_fresh/MainPage/MainPage.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);
  static const RouteName = '/';

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  var defColor = Color(0xffACFFAD);
  var _spinner = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    late var referenceData1 =
        FirebaseDatabase.instance.reference().child('Spinner');

    // Query referenceData;
    // referenceData = FirebaseDatabase.instance.reference()
    //     .child('Spinner');

    referenceData1.once().then((snapShot) {
      _spinner.add(snapShot.value);

      // var keys = snapShot.value.keys;
      // var values = snapShot.value;
      // for (var key in keys) {
      //   spinner Spinner = new spinner(
      //     values[key]['id_type'],
      //     values[key]['name'],
      //   );
      //   _spinner.add(Spinner);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.greenAccent[700],
          ),
          preferredSize: Size.fromHeight(1)),
      backgroundColor: defColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image(
              image: AssetImage('images/4fresh.png'),
              width: 60,
            ),
            height: 160,
// child: Image(image: AssetImage('images/cart.png')),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            '4 Fresh',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'اونلاين هايبر ماركت  ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'أختر المنطقه',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 25,
          ),
          FlatButton(
              color: Colors.greenAccent[700],
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.RouteName, (route) => false);
              },
              child: Text(
                'ابداء التسوق',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegistryPage.RouteName);
              },
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              )),
        ]),
      ),
    );
  }
}

class spinner {
  late String id_type, name;
  spinner(this.id_type, this.name);
}
