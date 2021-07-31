
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:my_fresh/Provaidor/My%20Provaider.dart';
import 'package:provider/provider.dart';






class Section1 extends StatefulWidget {
  @override
  _Section1State createState() => _Section1State();
}

class _Section1State extends State<Section1> {


  List<Product> productList = [];

  var defColor = Color(0xff40a8c4);
  int count =0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Query referenceData;
    referenceData = FirebaseDatabase.instance
        .reference()
        .child('Product')
        .orderByChild('id_type')
        .equalTo('fruit_مدينة نصر')
    ;
    referenceData.once().then(
            (DataSnapshot dataSnapShot)
         {
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

     for (var key in keys) {
        Product product = new Product(
          values[key]['id_type'],
          values[key]['image'],
          values[key]['name'],
          values[key]['price'],
          values[key]['weight'],
        );
        productList.add(product);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body:GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: MediaQuery.of(context).size.height * .47,
                  childAspectRatio: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
                ),
                itemCount: productList.length,
                itemBuilder: (_, index) {
                  return
                    Provider.of<MyProvaider>(context).
                    CardUi(
                      productList[index].id_type,
                    productList[index].image,
                    productList[index].name,
                    productList[index].price,
                    productList[index].weight,
                  );
                }));
  }




}



class Product  {
  late String id_type, image , name , price ,weight;
  Product(this.id_type,this.image,this.name,this.price,this.weight);
}


// ignore: non_constant_identifier_names
// Widget CardUi(
//     String idType, String image, String name, String price, String weight) {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black12,width: 3),
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(
//         20,
//       ),
//     ),
//     margin: EdgeInsets.all(1.5),
//     padding: EdgeInsets.all(10),
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 20),
//           child: Container(
//             height: 20,
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.all_inbox),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Image.network(
//           image,
//           fit: BoxFit.cover,
//           height: 100,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(name,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold)),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(weight),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * .17,
//             ),
//             Text(
//               ' $price ج.م',
//               style: TextStyle(color: Colors.blueAccent),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           color: Colors.red,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               GestureDetector(
//                 child: Icon(
//                   Icons.remove,
//                   color: Colors.white,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     if (count > 1) {
//                       count--;
//                     }
//                   });
//                 },
//               ),
//               Text(
//                 count.toString(),
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//               GestureDetector(
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     count++;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//
//       ],
//     ),
//   );
// }





















// appBar: PreferredSize(
//     child: AppBar(
//       // leading: IconButton(
//       //   icon: Icon(
//       //     Icons.arrow_back,color: Colors.red,),
//       //   onPressed: (){
//       //     Navigator.pop(context);
//       //   },
//       // ),
//
//       backgroundColor: defColor,
//     ),
//     preferredSize: Size.fromHeight(0)),
