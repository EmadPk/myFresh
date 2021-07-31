import 'package:flutter/material.dart';

class OrignalBox extends StatelessWidget {
  final double width;
  final double height;
  final String imageName;
  final String boxName;

  const OrignalBox(
      {required this.width,
      required this.height,
      required this.imageName,
      required this.boxName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$imageName'),
            fit: BoxFit.fill,
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: FractionalOffset.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$boxName',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
