import 'package:flutter/material.dart';
import 'package:mealgenerator/home.dart';

import 'package:provider/provider.dart';

import 'Favoris_Recette.dart';
import 'auth_provider.dart';
import 'menu.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 174, 153, 107),
        leading:   IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
       
             
              ),
        title: Padding(
          padding: const EdgeInsets.only(left: 128.0),
          child: const Text(" معلومات الحساب"),
        ),
        actions: [
           IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 233, 231, 228),
          selectedItemColor: Color.fromARGB(255, 228, 185, 42),
          unselectedItemColor: Color.fromARGB(255, 228, 185, 42),
          
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "المفضلة",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "حسابي",
            ),
          ],
          onTap: (value) => {
                if (value == 0)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    )
                  }
                else if (value == 1)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Favoris()),
                    )
                  }
                else if (value == 2)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userProfile()),
                    )
                  }
              }),
   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(
          child: Container(
                      padding: EdgeInsets.all(20),
                      height: 300,
                      width: 300,
                      child: Image.asset("images/cook.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 174, 153, 107),
                      ),
                    ),
        ),
        const SizedBox(height: 20),
        Text(ap.userModel.name, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 174, 153, 107))),
         const SizedBox(height: 30),
        Text(ap.userModel.phoneNumber, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 174, 153, 107))),
          ],
        ),
      ),
    );
  }
}
