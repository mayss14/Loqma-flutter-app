import 'package:flutter/material.dart';
import 'package:mealgenerator/dessert.dart';
import 'package:mealgenerator/SearchPage.dart';
import 'package:mealgenerator/snack.dart';
import 'package:page_transition/page_transition.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu(context),
      backgroundColor: Colors.white,
    );
  }
}

Widget menu(BuildContext context) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;

  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Center(
            child: Text(
              "شنو بغيتي طيب بالضبط ؟ ",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 90, 60, 42),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 6,
        child: Container(
          width: double.infinity,
          child: Container(
            // searchrecipekkV (1:2256)
            width: double.infinity,
            height: 820 * fem,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(248, 240, 222, 180),
                  Color.fromARGB(248, 255, 240, 203),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50 * fem),
                  topRight: Radius.circular(50 * fem)),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0 * fem,
                  top: 40 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        17 * fem, 0 * fem, 17 * fem, 0 * fem),
                    width: 375 * fem,
                    height: 699 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //carte des plat principaux
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                225 * fem, 18 * fem, 26 * fem, 21 * fem),
                            width: double.infinity,
                            height: 175 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.multiply,
                                ),
                                image: AssetImage(
                                  'images/rice1.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 120 * fem,
                                          ),
                                          child: Text(
                                            "طبق رئيسي",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 30 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: SearchPage()));
                          },
                        ),
                        SizedBox(
                          height: 30 * fem,
                        ),

                        //carte de dessert
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Snack())),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                225 * fem, 18 * fem, 26 * fem, 21 * fem),
                            width: double.infinity,
                            height: 175 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.multiply,
                                ),
                                image: AssetImage(
                                  'images/salad1.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 120 * fem),
                                          child: Text(
                                            " وجبة خفيفة",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 30 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30 * fem,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Dessert())),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                225 * fem, 18 * fem, 26 * fem, 21 * fem),
                            width: double.infinity,
                            height: 175 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.multiply,
                                ),
                                image: AssetImage(
                                  'images/pancake1.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 120 * fem,
                                          ),
                                          child: Text(
                                            " حلويات",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 29 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
