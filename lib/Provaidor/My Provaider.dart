import 'package:flutter/material.dart';

class MyProvaider with ChangeNotifier{

  List<Product> productList = [];



  Widget CardUi(
      String idType, String image, String name, String price, String weight) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12,width: 3),
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      margin: EdgeInsets.all(1.5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.all_inbox),
                  )
                ],
              ),
            ),
          ),
          Image.network(
            image,
            fit: BoxFit.cover,
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weight),
              SizedBox(
                // width: MediaQuery.of(context).size.width * .17,
              ),
              Text(
                ' $price ج.م',
                style: TextStyle(color: Colors.blueAccent),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

        ],
      ),
    );
    notifyListeners();
  }

}




class Product with ChangeNotifier{
  late String id_type, image , name , price ,weight;
  Product(this.id_type,this.image,this.name,this.price,this.weight);
  notifyListeners();

}