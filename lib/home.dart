import 'package:flutter/material.dart';
import 'package:mealgenerator/menu.dart';
import 'package:page_transition/page_transition.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
      body: mainPage(context),
      backgroundColor: Color.fromARGB(248, 255, 240, 203),
    );
  }
}

Widget mainPage(BuildContext context) {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        height: 620,

        //margin: EdgeInsets.only(left: 1, right: 1),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage("images/home3.png"), fit: BoxFit.cover),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 430, left: 30, right: 30),
            child: SizedBox(
              child: Text(
                "مرحبا بيك فالتطبيق رقم 1 في المغرب لي يجيب ليك جميع الوصفات لي تقدري تحضريها فقط بالمكونات المتوفرة عندك فالدار",
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 90, 60, 42),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight, child: Menu()));
          },
          child: Text(" هيا بنا "),
          style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(30),
              textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              primary: Color.fromARGB(255, 255, 253, 250),
              onPrimary: Color.fromARGB(255, 120, 91, 68),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    ],
  );
}
