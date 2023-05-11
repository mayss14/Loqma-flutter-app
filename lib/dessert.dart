import 'package:flutter/material.dart';

class Dessert extends StatelessWidget {
  const Dessert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(" حلويات",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 90, 60, 42))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 30, left: 12),
            child: Image(image: AssetImage("images/logBrown.png")),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: menu(context),
      backgroundColor: Color.fromARGB(248, 240, 222, 180),
    );
  }
}

Widget menu(BuildContext context) {
  return Container();
}
