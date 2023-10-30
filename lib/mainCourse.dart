import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mealgenerator/RecetteModel.dart';
import 'package:mealgenerator/RecipeDetail.dart';
import 'package:mealgenerator/dessert.dart';
import 'package:mealgenerator/SearchPage.dart';
import 'package:mealgenerator/recipecard.dart';
import 'package:mealgenerator/snack.dart';
import 'package:mealgenerator/userProfile.dart';
import 'package:page_transition/page_transition.dart';

import 'Favoris_Recette.dart';
import 'menu.dart';

class Mc extends StatelessWidget {
  Mc({super.key, required this.selectedItems});
  final List<String> selectedItems;

  int check(List tags) {
    var pr = 1;
    for (var i = 0; i < selectedItems.length; i++) {
      if (tags.contains(selectedItems[i])) {
        pr = pr * 1;
      } else {
        pr = pr * 0;
        break;
      }
    }
    if (selectedItems.isEmpty) {
      pr = 0;
    }
    return pr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
             gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(248, 251, 243, 224),
                  Color.fromARGB(248, 255, 230, 161),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
             ),

          ),
      child: Scaffold(
       
        appBar: AppBar(
           leading: Padding(
             padding: const EdgeInsets.only(left:20.0),
             child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
       
             
              ),
           ),
          foregroundColor: Color.fromARGB(255, 174, 153, 107),
          title: Padding(
            padding: const EdgeInsets.only(left:200.0),
            child: Text("طبق رئيسي",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ),
          backgroundColor: Colors.white,
         
        ),
        body:
         FutureBuilder(
            future: loadJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<RecetteModel>;
              
                final String cat = "maincourse";
                final String catAr = "طبق رئيسي";

                return (
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      
                    String str= items[index].tags.toString();
                    List <String> list= str.split(",");
                     if(check(list) != 0)
                      {
                        return InkWell(
                          child: RecipeCard(
                            title: items[index].videoTitle.toString(),
                            cookTime: items[index].time.toString(),
                            rating: items[index].rate.toString(),
                            thumbnailUrl: items[index].img.toString(),
                            visible: true,
                            cal: items[index].cal.toString(),
                            ),
                            onTap: () => Navigator.push(
                            context,    PageTransition(
                               type: PageTransitionType.leftToRight, child: RecipeDetail(index: index, catEng: cat,catAr: catAr,) )
                            ),
                        );
                      }
                      else 
                      {
                        return Center(
                        );
                      }
                    }));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
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
   
      ),
    );
  }
}

/*
 
  */
//function to fetch data from json file
Future<List<RecetteModel>> loadJsonData() async {
  final jsonText =
      await rootBundle.rootBundle.loadString('assets/maincourse.json');
  Map<String, dynamic> data = await json.decode(jsonText);
  List<dynamic> recipes = data["data"];
  return recipes.map((r) => RecetteModel.fromJson(r)).toList();
}


