import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mealgenerator/recipecard.dart';
import 'package:mealgenerator/userProfile.dart';
import 'package:page_transition/page_transition.dart';
import 'IconAndText.dart';
import 'RecetteModel.dart';
import 'RecipeDetail.dart';
import 'menu.dart';

class Favoris extends StatelessWidget {
  const Favoris({super.key});

  @override
  Widget build(BuildContext context) {
    List liste_id = [];
    var id;
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
            padding: const EdgeInsets.only(left: 120.0),
            child: Text(
              " الوصفات المفضلة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.white,
      ),
      body:
      StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection("/users-favourite-recipes/w8kBvWz4miQuhLm7YbqPdzNFR5e2/items").snapshots(),

  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError)
      return  Text('Error: ${snapshot.error}');
    switch (snapshot.connectionState) {
      case ConnectionState.waiting: return  Center(child: CircularProgressIndicator());
      default:
        return new ListView(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return new RecipeCard(
              title: document['name'],
              cookTime: document['time'],
              rating: document['rate'],
              thumbnailUrl: document['image'].toString(),
              visible: true,
              cal :  document['cals']
            );
          }).toList(),
        );
    }
  }),
    backgroundColor: Color.fromARGB(248, 240, 222, 180),
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
   
    );
     
    }
}



