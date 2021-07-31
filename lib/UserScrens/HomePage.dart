import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/Orignal/OrignalBox.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  var defColor = Color(0xff40a8c4);

  List menuItems = [
    'فواكه',
    'سلة الفواكه',
    'خضروات',
    'خضروات جاهزة',
    'دواجن وبيض',
    'حلويات',
    'بـقـالـه',
    'عطارة',
    'عروض اليوم',
  ];

  int _curentIndex = 0;



  List sliderImages = [
    'images/fakha.jpg',
    'images/8daar.jpg',
    'images/3etara.jpg',
    'images/7alwyat.jpg',
    'images/f2.jpg',
    'images/fakha2.jpg',
  ];

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   DatabaseReference referenceData =
  //   FirebaseDatabase.instance.reference().child('Note');
  //   referenceData.once().then((DataSnapshot dataSnapShot) {
  //     var keys = dataSnapShot.value.keys;
  //     var values = dataSnapShot.value;
  //     var key = keys;
  //       HomeText homeText = new HomeText(
  //         values[key]['home'],
  //       );
  //       homeTextList.add(homeText);
  //
  //     // for (var key in keys) {
  //     //   HomeText homeText = new HomeText(
  //     //     values[key]['home'],
  //     //   );
  //     //   homeTextList.add(homeText);
  //     // }
  //   });
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: defColor,
            centerTitle: true,
            title: Text('one'),
            leading: Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.yellowAccent,
                      size: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        '${1}',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(40)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider.builder(
                itemCount: sliderImages.length,
                itemBuilder: (_, int index, int realIndex) {
                  return Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                    ),
                    child: Image.asset(
                      sliderImages[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setState(() {
                      _curentIndex = index;
                    });
                  },
                  pauseAutoPlayOnTouch: false,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * .2,
                  autoPlay: true,
                  initialPage: 0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(0),
                buildContainer(1),
                buildContainer(2),
                buildContainer(3),
                buildContainer(4),
                buildContainer(5),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrignalBox(
                          boxName: '${menuItems[0]}',
                          height: .2,
                          imageName: 'fakha2.jpg',
                          width: .475,
                        ),
                        OrignalBox(
                          boxName: '${menuItems[5]}',
                          height: .2,
                          imageName: '7alwyat.jpg',
                          width: .475,
                        ),
                      ],
                    ),
                  ),
                  OrignalBox(
                    boxName: '${menuItems[8]}',
                    height: .2,
                    imageName: '3rood.jpg',
                    width: 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrignalBox(
                          boxName: '${menuItems[4]}',
                          height: .2,
                          imageName: 'f2.jpg',
                          width: .475,
                        ),
                        OrignalBox(
                          boxName: '${menuItems[2]}',
                          height: .2,
                          imageName: '8daar.jpg',
                          width: .475,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrignalBox(
                          boxName: '${menuItems[6]}',
                          height: .2,
                          imageName: 'beqala.jpg',
                          width: .475,
                        ),
                        OrignalBox(
                          boxName: '${menuItems[7]}',
                          height: .2,
                          imageName: '3etara.jpg',
                          width: .475,
                        ),
                      ],
                    ),
                  ),
                  OrignalBox(
                    boxName: 'صحتك فى مقاله',
                    height: .2,
                    imageName: 'helthy.jpg',
                    width: 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrignalBox(
                          boxName: '${menuItems[3]}',
                          height: .2,
                          imageName: '8daar2.jpg',
                          width: .475,
                        ),
                        OrignalBox(
                          boxName: '${menuItems[1]}',
                          height: .2,
                          imageName: 'sala.jpg',
                          width: .475,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  Container buildContainer(int index) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 5) ,
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: _curentIndex == index ? Colors.redAccent : Colors.black87,
          shape: BoxShape.circle),
    );
  }
}


