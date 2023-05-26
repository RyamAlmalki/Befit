import 'package:befit/screens/result_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/bmi.dart';


class StatScreen extends StatefulWidget {
   const StatScreen({super.key});

  @override
  State<StatScreen> createState() =>
      StatScreenState();
}

class StatScreenState extends State<StatScreen> {
  final Color withAction = HexColor("#464762");
  final Color backgroundColor = HexColor("#4CBF99");
  final Color noAction = HexColor("#F5F4F6");
  List<Bmi>? bmilist = ResultScreenState.bmilist;
  List<FlSpot> points = [];

  List<FlSpot> placePoints(){

    for (var i = 0; i < bmilist!.length; i++) {
        points.add(FlSpot( bmilist![i].date?.month.toDouble() ?? 0, bmilist![i].bmi));
      }

   


    return points;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: withAction,
      title: const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child:  Text(
            'Statistic',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
     ),
     ),

      body: Column(children: [

              SizedBox(height: 20,),

              Row(children: [

                 SizedBox(width: 35,),
                Text(
                 'BMI',
                 textAlign: TextAlign.left,
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: withAction,),
                 ),

               



              ],),
              

              SingleChildScrollView(
                
                child: SizedBox(
                  height: 400,
                  width: 500 ,
                  
                  child: Center(
                    child: Container(
                      
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.fromLTRB(20,30,20,5),
                      
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color:noAction,
                        ),
                      child: 
                        LineChart(
                          LineChartData(
                            
                            backgroundColor: noAction,
                            gridData: FlGridData(drawVerticalLine: false),
                            borderData: FlBorderData(border: Border(right: BorderSide(color: Colors.transparent), )),
                            lineTouchData: LineTouchData(enabled: true),
                            lineBarsData: [
                              LineChartBarData(
                                
                                spots: placePoints(),

                                  barWidth: 4,
                                  color: backgroundColor,
                                  aboveBarData: BarAreaData(show: false),
                                  dotData: FlDotData(
                                    show: true,
                                  ),
                                ),
                              ],
                  
                            minY: 0,
                            maxY: 30,
                            minX: 0,
                            maxX: 12,
                            titlesData: FlTitlesData(
                              
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                             
                               bottomTitles: AxisTitles(
                                  
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return Text('1');
                                        case 1:
                                           return Text('2');
                                        case 2:
                                          return Text('3');
                                        case 3:
                                           return Text('4');
                                        case 4:
                                          return Text('5');
                                        case 5:
                                           return Text('6');
                                        case 6:
                                          return Text('7');
                                        case 7:
                                           return Text('8');
                                        case 8:
                                           return Text('9');
                                        case 9:
                                           return Text('10');
                                        case 10:
                                           return Text('11');
                                        case 11:
                                           return Text('12');
                                        default: 
                                          return Text('');                 
                                      }
                                    }
                               ),
                              )
                            )
                  
                  
                  
                            
                          ),
                        ),
                                
                    ),
                  ),
                ),
              ),

            
              
           ],
        ) 
      );
    }
  }

