import 'package:flutter/material.dart';
import 'package:mealgenerator/recipecard.dart';

import 'multiselect.dart';

class MainCourse extends StatefulWidget {
  const MainCourse({Key? key}) : super(key: key);

  @override
  State<MainCourse> createState() => _MainCourseState();
}

class _MainCourseState extends State<MainCourse> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text("طبق رئيسي ",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 90, 60, 42))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 30, left: 12),
            child: Image(image: AssetImage("images/logBrown.png")),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body:
          Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 70, top: 50, right: 60),

          child:
           ElevatedButton(
            onPressed: _showMultiSelect,
            child: Row(
              children: [
                Icon(Icons.search_rounded),
                const Text('اختاري المكونات المتوفرة عندك ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 126, 89, 65),
              onPrimary: Colors.white,
              minimumSize: Size(150, 55),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
               
              ),
            ),
          ),

        ),
      ),
      backgroundColor: Color.fromARGB(248, 240, 222, 180),
    );
  }
}
