import 'package:befit/model/bmi.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final double? bmi;
  ResultScreen({super.key, required this.bmi,});

  @override
  State<ResultScreen> createState() =>
      ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
  final Color withAction = HexColor("#464762");
  static List<Bmi>? bmilist = [];
  final Color primaryColor = HexColor("#FFFFFF");
  final Color secondColor = HexColor("#F8FBFF");
  final Color noAction = HexColor("#F5F4F6");
  final Color backgroundColor = HexColor("#4CBF99");
  String? type;
  Color? colorcircle;


  @override
  void initState() {
    if (widget.bmi! < 18.5) {
      type = "Underweight";
      colorcircle = Colors.blue;
    } else if (widget.bmi! >= 18.5 && widget.bmi! <= 24.9) {
      type = "Normal";
      colorcircle = Colors.green;
    } else if (widget.bmi! >= 25 && widget.bmi! <= 29.9) {
      type = "Overweight";
      colorcircle = Colors.yellow;
    } else if (widget.bmi! >= 30 && widget.bmi! < 39.9) {
      type = "Obese";
      colorcircle = Colors.orange;

    }else if (widget.bmi! >= 40) {
      type = "Morbidly Obese";
      colorcircle = Colors.red;
      
    }
    super.initState();
  }



  void addUserbmi(){
    bmilist?.add(Bmi(bmi: widget.bmi, date: DateTime.now()));
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:  Colors.white,
      body: Center(
        child: Column(

          
          children: [
            SizedBox(width: 100, height: 50,),

            Row(children: [
               TextButton(
                  child: Text(
                          'x',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: withAction),
                          ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MyHomePage()), (route) => false);
                  },
                ),
              ],
            ),

            SizedBox(height: 100,),
            
            Image.asset('assets/bmi.png'), 

            Container(
              height: 200,
              width: 400,
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.transparent,
              ),
              child: Column(children: [
              


               Text(
                   'Your BMI is ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: withAction),
                   ),
              Text(
                   '${widget.bmi} ',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: withAction),
                   ),
              
              Row(children: [
                 const SizedBox(width: 120,),

                 Text(
                   '$type',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: withAction),
                   ),

                const SizedBox(width: 10,),

                CircleAvatar(
                    backgroundColor: colorcircle,radius: 15,)
              ],
              
              )
             

              ]),
            ),

             GestureDetector(
                    onTap: (){
                      setState(() {
                        addUserbmi();
                        Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const MyHomePage()), (route) => false);
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
                          'Save',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                      
                      ),
                    ),
                    
                  ),
              )


           
          ]
        ),
      ),
    );
  }
}

