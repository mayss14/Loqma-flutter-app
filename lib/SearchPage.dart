import 'package:flutter/material.dart';
import 'package:mealgenerator/recipecard.dart';
import 'package:mealgenerator/userProfile.dart';

import 'Favoris_Recette.dart';
import 'menu.dart';
import 'multiselect.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}



class _SearchPageState extends State<SearchPage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final items = <String>[
      'مكرونة',
      'بطاطس',
      'بيض',
      'بصل',
      'أرز',
      'لحم',
      'طماطم',
      'شفلور',
      'بزلاء',
      'فلفل',
      'جزر',
      'زبدة',
      'زيت',
      'ثوم',
      'لحم مفروم',
      'عدس',
      'سمن',
      'طون',
      'حليب',
      
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
    if (results != null) {
      setState(() {
        _selectedItems = results;
       
      });
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Column(
          children: [
            
            Container(
           
            child: Padding(
              padding: const EdgeInsets.only(left: 70, top: 50, right: 60),

              child:
               ElevatedButton(
                onPressed: _showMultiSelect,
                
                child: Row(
                  
                  children: [
                    
                    Icon(Icons.search_rounded),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('اختاري المكونات المتوفرة عندك ',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 174, 153, 107),
                  onPrimary: Colors.white,
                  minimumSize: Size(150, 55),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   
                  ),
                ),
              ),

            ),
      ),
          ],
        ),
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
