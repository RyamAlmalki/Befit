
import 'package:befit/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../model/bmi.dart';



class DiaryScreen extends StatefulWidget {
   const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() =>
      DiaryScreenState();
}


class DiaryScreenState extends State<DiaryScreen> {
  final Color withAction = HexColor("#464762");
  List<Bmi>? bmilist = ResultScreenState.bmilist;

  final Color noAction = HexColor("#F5F4F6");

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:  Colors.white,
    appBar: AppBar(
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: withAction,
      title: const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child:  Text(
            'Diary',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

     ),
     ),

      body: ListView.separated(
        itemCount: bmilist?.length ?? 0,
        itemBuilder: (context, index) {
          return Dismissible( // Step 1
          key: UniqueKey(),
            onDismissed: (direction) { // Step 2
              setState(() {
                bmilist?.removeAt(index);
              });
              
            },
            child: ListTile(
              //visualDensity: VisualDensity(vertical: 4),
              
              title: Text('    BMI ${bmilist![index].bmi}' ),
              subtitle: Text("    ${bmilist![index].date?.day}-${bmilist![index].date?.month}-${bmilist![index].date?.year}"),
              trailing: Icon(Icons.more_vert),
            ),
          );
        }, separatorBuilder: (context, index) {
          return Divider();
        },
        
      )
      
    );
  }


}

