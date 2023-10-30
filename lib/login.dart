import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginbTs (1:199)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroupbrcrHLh (9yhB7qmeauX3AVYgJSBRcR)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 13.64 * fem),
              width: double.infinity,
              height: 267.36 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle1n2Z (1:200)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 375 * fem,
                        height: 267 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xfff7fde4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // recipeappTeV (1:201)
                    left: 22 * fem,
                    top: 154 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 111 * fem,
                        height: 60 * fem,
                        child: Text(
                          'RECIPE\nAPP',
                          style: TextStyle(
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.6649999619 * ffem / fem,
                            letterSpacing: 8.28 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // cookingpanaXPT (1:202)
                    left: 155 * fem,
                    top: 57 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 212 * fem,
                        height: 210.36 * fem,
                        child: Image.asset(
                          'images/cook.png',
                          width: 212 * fem,
                          height: 210.36 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group106PgZ (1:412)
                    left: 20 * fem,
                    top: 54 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          12.46 * fem, 12.05 * fem, 13.26 * fem, 13.67 * fem),
                      width: 74 * fem,
                      height: 74 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-0.068, -0.095),
                          end: Alignment(0.135, -0.095),
                          colors: <Color>[
                            Color.fromARGB(255, 235, 208, 149),
                            Color.fromARGB(255, 247, 216, 143)
                          ],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Center(
                        // epicecreamroundokH (1:414)
                        child: SizedBox(
                          width: 48.27 * fem,
                          height: 48.27 * fem,
                          child: Image.asset(
                            'images/logApp.png',
                            width: 48.27 * fem,
                            height: 48.27 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // enteryourphonenumberp37 (1:392)
              margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 10 * fem),
              constraints: BoxConstraints(
                maxWidth: 179 * fem,
              ),
              child: Text(
                'Enter your \nPhone Number',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  letterSpacing: -0.24 * fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // letsgetyoustartedGA1 (1:393)
              margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 70 * fem),
              child: Text(
                'Let’s get you started',
                style: TextStyle(
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.6649999619 * ffem / fem,
                  letterSpacing: 0.14 * fem,
                  color: Color(0xffc5c6ca),
                ),
              ),
            ),
            Container(
              // mobilenumberLvZ (1:394)
              margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 0 * fem),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.6999999455 * ffem / fem,
                  color: Color(0xffc4c4c4),
                ),
              ),
            ),
            Container(
              // autogroupztpxFnd (9yhBffBxzCXopCeJxHZtPX)
              padding:
                  EdgeInsets.fromLTRB(15 * fem, 51 * fem, 15 * fem, 32 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // line1yid (1:396)
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 0 * fem, 5 * fem, 29 * fem),
                    width: double.infinity,
                    height: 1 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffc4c4c4),
                    ),
                  ),
                  Container(
                    // frame1u6V (1:397)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 1 * fem, 50 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 344 * fem,
                        height: 55 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff9fc727),
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.6649999619 * ffem / fem,
                              letterSpacing: 0.48 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
