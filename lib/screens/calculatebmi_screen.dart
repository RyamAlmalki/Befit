


import 'dart:math';

import 'package:befit/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';


class CalculateBMIScreen extends StatefulWidget {
   const CalculateBMIScreen({super.key});

  @override
  State<CalculateBMIScreen> createState() =>
      CalculateBMIScreenState();
}


class CalculateBMIScreenState extends State<CalculateBMIScreen> {
  final Color withAction = HexColor("#464762");
  final Color noAction = HexColor("#F5F4F6");
  final Color backgroundColor = HexColor("#4CBF99");
  int _selectedWeight = 77;
  int _selectedHeight = 170;
  int _selectedAge = 12;
  int _selectedGender = 0;
  late double bmi;

  @override
  Widget build(BuildContext context) {

  return Scaffold(
      backgroundColor:  Colors.white,
     appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: withAction,
      title: const Padding(
      padding: EdgeInsets.only(left: 0.0),
      child:  Text(
            'BMI Calculator',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
      ),
     ),

    body: SafeArea(child: 
      Center(
        child:Column(
          children: [

            CupertinoButton(
              child: ListTile(
                  tileColor: noAction,
                  leading:  CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: Icon(Icons.person, color: Colors.white,),
                  ),
                  title: _selectedGender == 0? Text('Female'): Text('Male'),
                  subtitle: Text('Gender'),
                  trailing: Icon(Icons.edit),
                ),
              onPressed: () => showCupertinoModalPopup(context: context, 
              builder: (_) => SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(initialItem: 0),
                      children: const [
                        Text('Femal'),
                        Text('Male'),
                      ],
                      onSelectedItemChanged: (value) => {
                        setState(() {
                          _selectedGender = value;
                        },)
                      },
                    ),
                  )
                ),
              ),

            CupertinoButton(
              child: ListTile(
                  tileColor: noAction,
                  leading:  CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: Icon(Icons.cake, color: Colors.white,),
                  ),
                  title: Text('$_selectedAge'),
                  subtitle: Text('Age'),
                  trailing: Icon(Icons.edit),
                ),
              onPressed: () => showCupertinoModalPopup(context: context, 
              builder: (_) => SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(initialItem: 11),
                      children: [for (var i = 1; i <= 110; i++) Text('$i')],
                      onSelectedItemChanged: (value) => {
                        setState(() {
                          _selectedAge = value;
                        },)
                      },
                    ),
                  )
                ),
              ),

            CupertinoButton(
              child: ListTile(
                  tileColor: noAction,
                  leading:  CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: Icon(Icons.monitor_weight, color: Colors.white,),
                  ),
                  title: Text('$_selectedWeight'),
                  subtitle: Text('Weight'),
                  trailing: Icon(Icons.edit),
                ),
              onPressed: () => showCupertinoModalPopup(context: context, 
              builder: (_) => SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(initialItem: 76),
                      children: [for (var i = 1; i <= 110; i++) Text('$i')],
                      onSelectedItemChanged: (value) => {
                        setState(() {
                          _selectedWeight = value;
                        },)
                      },
                    ),
                  )
                ),
              ),
            
              CupertinoButton(
              child: ListTile(
                  tileColor: noAction,
                  leading:  CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: Icon(Icons.height, color: Colors.white,),
                  ),
                  title: Text('$_selectedHeight'),
                  subtitle: Text('Height'),
                  trailing: Icon(Icons.edit),
                ),
              onPressed: () => showCupertinoModalPopup(context: context, 
              builder: (_) => SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(initialItem: 169),
                      children: [for (var i = 1; i <= 300; i++) Text('$i')],
                      onSelectedItemChanged: (value) => {
                        setState(() {
                          _selectedHeight = value;
                        },)
                      },
                    ),
                  )
                ),
              ),

                  SizedBox(height: 10,),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        navigateToResultScreen(12.0);
                      });
                    },
                    child: AbsorbPointer(child: Container(
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: backgroundColor,
                      ),
                      child: const Center(
                          child: Text(
                          'Calculate',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                      
                      ),
                    ),
                    
                  ),
              )
              



          ],
        ),
        )
      ),   
    );
  }

  void navigateToResultScreen(double result){
    bmi = calculateBMI(_selectedHeight, _selectedWeight);
    print(bmi);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmi: bmi)));
  }


  double calculateBMI(int height, int weight) {
    double heightInMeters = height / 100;
    bmi = weight / (heightInMeters * heightInMeters);
    num mod = pow(10.0, 2); 
    return ((bmi * mod).round().toDouble() / mod); 
  }


}

