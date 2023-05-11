import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mealgenerator/RecetteModel.dart';
import 'package:mealgenerator/dessert.dart';
import 'package:mealgenerator/mainCourse.dart';
import 'package:mealgenerator/recipecard.dart';
import 'package:mealgenerator/snack.dart';

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
          InkWell(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 30, left: 12),
                child: Image(image: AssetImage("images/logBrown.png")),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainCourse()));
              }),
        ],
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: FutureBuilder(
          future: loadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<RecetteModel>;
              
              return (ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                  String str= items[index].tags.toString();
                  List <String> list= str.split(",");
                   if(check(list) != 0)
                    {return RecipeCard(
                        title: items[index].videoTitle.toString(),
                        cookTime: '30 دقيقة',
                        rating: '5',
                        thumbnailUrl: items[index].img.toString(),
                        visible: true);
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



/*
  List items = [];
  //function to fetch data from json file
 

  Widget cards(List <String> item) {
    //List<String> tags = ['بطاطس', 'جبن'];
    loadJsonData();
    
    bool vis = false;
    for (var i = 0; i < items.length; i++) {
      //tags = items[i]["tags"] as List<String>;
      if (check(tags) != 0) {
        vis = true;
      }
      vis = false;
    }

    return (ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return RecipeCard(
              title: items[index]['videoTitle'],
              cookTime: '30 دقيقة',
              rating: '5',
              thumbnailUrl: items[index]['img'],
              visible: true);
        }));
  }
}*/
