import 'package:flutter/material.dart';
import 'package:proj/dropdownmenue.dart';
import 'package:proj/textfeild.dart';
import 'activity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Actiivity current=acts[0];

  double totalWater = double.parse(acts[0].getWater());
  double x=0 ,r=0;
  void updateweight(kg){

    x=double.parse(kg);


  }

  void Updateresult(){
    setState(() {
      if(x==0 ){
        r=0;
      }
      else{ r= totalWater + (x *35);}

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.teal,
          title:

          Image.asset(
            'images/l.png',
            width: 400,
            height: 110,
          ),
        ),

      body:Container(
        color: Colors.lightBlue[50],
      child:   Center(
      child: Column( children: [
      SizedBox(height: 30,),
    Text('Child Water  Calculator',  style: TextStyle( fontSize: 20 ,fontWeight:FontWeight.bold,
        color:Colors.teal)),
        SizedBox(height: 20,),
    SizedBox(width: 300,
    height: 100,
    child:textfeild(f: updateweight, hint:  'Enter child weight(kg)',)
    ,
    ),

    Text(" Add activity level",
        style: TextStyle( fontSize: 20 ,fontWeight:FontWeight.bold,
            color:Colors.teal)
    ),
    SizedBox(height: 10),

       dropdownmenue(updateact: (k){
         this.current=k;
         totalWater=double.parse(k.getWater());
       },

       ),
        SizedBox(height: 20),
        ElevatedButton(onPressed:(){Updateresult();}, child: Text("Water need  ",
          style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.bold,
            color:Colors.green),
        ),
        ),
        SizedBox(height: 13),
        Text('the child need drink $r ml',style: TextStyle(fontSize: 20 ,fontWeight:FontWeight.bold,
            color:Colors.teal),
        ),

        SizedBox(height: 13),
        Text("A Baby Start Drinkig water at 6 months",style: TextStyle(fontSize: 17 ,fontWeight:FontWeight.bold,
            color:Colors.green),
        ),
      ],
      ),
    ),


    ),
    );
  }
}
