import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mealgenerator/ExpandableText.dart';
import 'package:mealgenerator/IconAndText.dart';
import 'package:mealgenerator/userProfile.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Favoris_Recette.dart';
import 'RecetteModel.dart';
import 'menu.dart';

class RecipeDetail extends StatelessWidget {
  var catAr;
  var catEng;
  var index;

  var id;

  var title;

  bool isFav = false;
  List ids = [];

  RecipeDetail(
      {super.key,
      required this.index,
      required this.catAr,
      required this.catEng});

  @override
  Widget build(BuildContext context) {
    String url = "assets/" + this.catEng + ".json";
    var title;

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
            padding: const EdgeInsets.only(left: 200.0),
            child: Text(
              "طبق رئيسي",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: loadJsonData(url),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<RecetteModel>;
            var videoId;

            title = items[index].videoTitle.toString();

            videoId = YoutubePlayer.convertUrlToId(
                items[index].youtubeLink.toString());

            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      child: (YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: videoId,
                            flags: YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor:
                              Color.fromARGB(255, 190, 162, 79),
                          progressColors: ProgressBarColors(
                            playedColor: Color.fromARGB(255, 236, 205, 141),
                            handleColor: Color.fromARGB(255, 245, 211, 131),
                          ))),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 8, bottom: 10),
                    child: Text(
                      items[index].videoTitle.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 90, 60, 42)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 233, 231, 228)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconAndText(
                              icon: Icons.circle_sharp,
                              text: catAr,
                              color: Colors.black,
                              iconColor: Color.fromARGB(115, 216, 186, 103)),
                          IconAndText(
                              icon: Icons.access_alarms_rounded,
                              text: items[index].time.toString(),
                              color: Colors.black,
                              iconColor: Color.fromARGB(115, 123, 7, 7)),
                          IconAndText(
                              icon: Icons.star_rate,
                              text: items[index].rate.toString(),
                              color: Colors.black,
                              iconColor: Colors.yellow),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 1,
                  child: Text(
                    "المقادير",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 90, 60, 42)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandableText(
                            text: items[index].videoDescription.toString()),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users-favourite-recipes")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("items")
                      .where("recipe_id", isEqualTo: items[index].id.toString())
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 120, right: 100),
                      child: ElevatedButton(
                        onPressed: () => snapshot.data.docs.length == 0
                            ? 
                                {
                                  addFavorite(
                                    items[index].id.toString(),
                                    items[index].videoTitle.toString(),
                                    items[index].img.toString(),
                                    items[index].videoDescription.toString(),
                                    items[index].rate.toString(),
                                    items[index].time.toString(),
                                    items[index].cal.toString()
                                    ),
                                    

                                showSnackBarText(context,
                                    "تم اضافة الوصفة الى المفضلة بنجاح")}
                              
                            : showSnackBarText(
                                context, " لقد تمت الإضافة من قبل"),
                        child: IconAndText(
                            icon: Icons.favorite,
                            text: "اضافة الى المفضلة",
                            color: Colors.black,
                            iconColor: Color.fromARGB(115, 169, 18, 18)),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 233, 231, 228),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 120, right: 100, bottom: 15),
                  child: ElevatedButton(
                    onPressed: (() => {
                          Share.share(items[index].youtubeLink.toString()),
                        }),
                    child: IconAndText(
                        icon: Icons.share,
                        text: " شارك مع الاصدقاء",
                        color: Colors.black,
                        iconColor: Color.fromARGB(115, 169, 18, 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 233, 231, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      backgroundColor: Colors.white,
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

  void showSnackBarText(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Future addFavorite(String id, String title,String img,String desc,String rate,String time,String cal) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-recipes");

    return _collectionRef.doc(currentUser!.uid).collection("items").doc().set({
      "recipe_id": id,
      "name": title,
      "image" : img,
      "description" : desc,
      "rate" :rate,
      "time" : time,
      "cals" : cal
     
    }).then((value) => isFav = true);
  }
}

Future<List<RecetteModel>> loadJsonData(String url) async {
  final jsonText = await rootBundle.rootBundle.loadString(url);
  Map<String, dynamic> data = await json.decode(jsonText);
  List<dynamic> recipes = data["data"];
  return recipes.map((r) => RecetteModel.fromJson(r)).toList();
}
