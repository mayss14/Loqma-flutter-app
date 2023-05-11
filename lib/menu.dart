import 'package:flutter/material.dart';
import 'package:mealgenerator/dessert.dart';
import 'package:mealgenerator/mainCourse.dart';
import 'package:mealgenerator/snack.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text("وصفتي",
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
      backgroundColor: Color.fromRGBO(240, 222, 180, 0.973),
    );
  }
}

Widget menu(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      InkWell(
        child: Container(
            height: 220,
            child: Stack(
              children: [
                Positioned(
                    top: 35,
                    left: 30,
                    child: Container(
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, right: 60, left: 210),
                        child: Text("طبق رئيسي ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 90, 60, 42),
                            )),
                      ),
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 101, 101, 101)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 20.0,
                            offset:
                                Offset(-10, 10), // changes position of shadow
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: 31,
                  left: 26,
                  child: Card(
                    elevation: 10,
                    shadowColor:
                        Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("images/rice.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainCourse()));
        },
      ),
      SizedBox(
        height: 10,
      ),
      //+++++++++++second card++++++++++++++++++++++++++++
      InkWell(
        child: Container(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 30,
                    child: Container(
                      height: 170,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, right: 60, left: 210),
                        child: Text("وجبة خفيفة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 90, 60, 42),
                            )),
                      ),
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 101, 101, 101)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 20.0,
                            offset:
                                Offset(-10, 10), // changes position of shadow
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: -4,
                  left: 26,
                  child: Card(
                    elevation: 10,
                    shadowColor:
                        Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("images/salad.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Snack()));
        },
      ),
      //+++++++++++++++++++++++++third card+++++++++++++++++++++++++
      InkWell(
        child: Container(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 30,
                    child: Container(
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 60, right: 60, left: 200),
                        child: Text(" حلويات",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 90, 60, 42),
                            )),
                      ),
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 101, 101, 101)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 20.0,
                            offset:
                                Offset(-10, 10), // changes position of shadow
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: -4,
                  left: 26,
                  child: Card(
                    elevation: 10,
                    shadowColor:
                        Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("images/pancake.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Dessert()));
        },
      ),
    ],
  );
}
