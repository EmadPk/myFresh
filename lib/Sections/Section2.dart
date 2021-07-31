import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:my_fresh/Provaidor/My%20Provaider.dart';
import 'package:provider/provider.dart';


class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List productList = Provider.of<MyProvaider>(context).productList;
    return Scaffold(
        backgroundColor: Colors.white10,
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: MediaQuery.of(context).size.height * .47,
              childAspectRatio: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
            ),
            itemCount: productList.length,
            itemBuilder: (_, index) {
              return Provider.of<MyProvaider>(context).CardUi(
                productList[index].id_type,
                productList[index].image,
                productList[index].name,
                productList[index].price,
                productList[index].weight,
              );
            }));
  }
}





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
