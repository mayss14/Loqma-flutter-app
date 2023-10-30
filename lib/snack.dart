import 'package:flutter/material.dart';

class Snack extends StatelessWidget {
  const Snack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        foregroundColor: Color.fromARGB(255, 174, 153, 107),
        title: Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Text(
            " مقبلات",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.white,
      ),
      body: menu(context),
      backgroundColor: Color.fromARGB(248, 240, 222, 180),
    );
  }
}

Widget menu(BuildContext context) {
  return Container();

  //NB
  //TO BE IMPLEMETED LATER ON
  //SAME CODE AS IN lib\maincourse.dart WILL BE APPLIED HERE
  //WITH THE NECESSARY CHANGES
  //DUE TO TIME CONSTRAINTS, THIS WILL BE IMPLEMENTED LATER ON
}
