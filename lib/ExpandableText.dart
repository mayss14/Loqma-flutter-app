import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);
   final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {

  
  late String firthalf;
  late String secondhalf;
  bool hiddenText=true	;
  double textHeight = 150;

  @override
  void initState() {
    
    super.initState();
    if(widget.text.length>200){
      firthalf=widget.text.substring(0,150);
      secondhalf=widget.text.substring(200+1,widget.text.length);
    }
    else{
      firthalf=widget.text;
      secondhalf="";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: secondhalf.isEmpty? //if secondhalf is empty
       Text(firthalf,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Color.fromARGB(255, 90, 60, 42)))
      ://else 
      Column(
        children: [
          Text(hiddenText? firthalf+ "...":firthalf+secondhalf,style: TextStyle(fontSize: 15),),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                Text(hiddenText? "تابع القراءة": "",style: TextStyle(color: Color.fromARGB(255, 214, 174, 44),),
                
                ),
                Icon(hiddenText? Icons.arrow_drop_down: Icons.arrow_drop_up,color: Color.fromARGB(255, 240, 209, 105)),
              ],
            ),
          )
        ],
      )
    );


    
  }
}