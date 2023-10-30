import 'package:flutter/material.dart';
import 'package:mealgenerator/auth_provider.dart';
import 'package:mealgenerator/menu.dart';
import 'package:mealgenerator/user_info.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
   double screenHeight = 0;

  double screenWidth = 0;
  double bottom = 0;


  @override
  Widget build(BuildContext context) {
    final isLoading =Provider.of<AuthProvider>(context, listen: true).isLoading;
     screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom; 

    return Scaffold(
      body: SafeArea(
        child: isLoading == true  ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 136, 98, 74),
                ),
              )
              //else
            : SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Stack(
                children: [ Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
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
                      " التحقق من رقم الهاتف",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 90, 60, 42)
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      " أدخل الرمز المرسل إلى رقم هاتفك",
                      style: TextStyle(
                        fontSize: 14,
                     
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 90, 60, 42)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    //***************** */
                  
                ],
                                      
                  
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
                       Otp(),
                       
                      ],
                    ),
                  ),
                ),
              ),
        
                ],
              ),
            ),
      ),
    );
  }

  Widget Otp()
  {
    return Column(children: [
      
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 245, 195, 121),
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                       child: Text(
                            "تحقق من الرمز",
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
                       
                        onPressed: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            showSnackBar(context, " الرجاء إدخال الرمز");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                      const Text(
                        " لم تستلم رمز التحقق؟",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 136, 98, 74),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        " إعادة إرسال الرمز",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 240, 169, 3),
                        ),
                  ),
    ]);
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {

    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Menu(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } 
            else 
            {
              // user doesn't exist in our app
               Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInfromationScreen()),
                  (route) => false);
            }
             
          },
        );
      },
    );
  }
}
