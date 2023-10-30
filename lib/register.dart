
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:provider/provider.dart';

import 'auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
    
  String countryDial = "+212";
  double screenHeight = 0;

  double screenWidth = 0;
  double bottom = 0;
  

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
          width: screenWidth,
        child: Stack(
          children: [ Center(
            child: Column(
              children: [
              Container(
                      padding: EdgeInsets.all(20),
                      height: 300,
                      width: 300,
                      child: Image.asset("images/cook.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(248, 255, 240, 203),
                      ),
                    ),
                const SizedBox(height: 20),
                const Text(
                  "   مرحبا و الف مرحبا ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 90, 60, 42),
                  ),
                ),
               
                const Text(
                  "  حيت عزيز و غالي علينا بغيناك تخلي لينا الاسم\n والرقم ديالك باش تبقى ديما معانا ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 90, 60, 42),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
               
              ],
            ),
          ),
           Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  height: bottom > 0 ? screenHeight : screenHeight / 2,
                  width: screenWidth,
                  color: Colors.white,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth / 12,
                      right: screenWidth / 12,
                      top: bottom > 0 ? screenHeight / 12 : 0,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Register(),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: ElevatedButton(
                            onPressed: () => {
                              sendPhoneNumber()
                            },
                            child: Text(
                              "ارسال",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              primary: Color.fromARGB(255, 136, 98, 74),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
          ]
        ),
      ),
    );
  }

   @override
  Widget Register() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: IntlPhoneField(
              cursorWidth: 1.5,
              controller: phoneController,
              showCountryFlag: true,
              showDropdownIcon: true,
              initialValue: countryDial,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+" + country.dialCode;
                });
              },
              decoration: InputDecoration(
                labelText: "رقم الهاتف",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }


  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+212"+phoneNumber);
  }
}
