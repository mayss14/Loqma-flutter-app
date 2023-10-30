import 'package:flutter/material.dart';
import 'package:mealgenerator/menu.dart';
import 'package:mealgenerator/register.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: mainPage(context),
      backgroundColor: Color.fromARGB(248, 255, 240, 203),
    );
  }
}

Widget mainPage(BuildContext context) {
   final ap = Provider.of<AuthProvider>(context, listen: false);

  return Column(
    children: [
      Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/home.png"), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 550, left: 20, right: 20),
              child: SizedBox(
                child: Text(
                  "مرحبا بيك فالتطبيق رقم 1 في المغرب لي يجيب ليك جميع الوصفات لي تقدر تحضر فقط بالمكونات المتوفرة عندك فالدار",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 90, 60, 42),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, bottom: 40),
          child: ElevatedButton(
            onPressed:() async {
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Menu(),
                                ),
                              ),
                            );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
            child: Text(" هيا بنا "),
            style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(30),
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                primary: Color.fromARGB(255, 255, 253, 250),
                onPrimary: Color.fromARGB(255, 120, 91, 68),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          ),
        ),
      ),
    ],
  );
}
