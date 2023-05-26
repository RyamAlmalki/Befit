import 'package:befit/screens/calculatebmi_screen.dart';
import 'package:befit/screens/diary_screen.dart';
import 'package:befit/screens/stat_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() =>
      MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final Color primaryColor = HexColor("#FFFFFF");
  final Color secondColor = HexColor("#F8FBFF");
  final Color noAction = HexColor("#AEAFBB");
  final Color withAction = HexColor("#464762");
  final Color backgroundColor = HexColor("#4CBF99");
   int _currentIndex = 0;

  List<Widget> _widgetOptions =  <Widget>[
     DiaryScreen(),
     StatScreen(),
     StatScreen(),
  ];

  void _changeItem(int value){
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: _widgetOptions.elementAt(_currentIndex),
    backgroundColor: secondColor,
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: 100,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
           Navigator.of(context).push(_createRoute());
          },
          child: Container(
            height: 100,
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 20, strokeAlign:BorderSide.strokeAlignCenter),
              shape: BoxShape.circle,
             color: backgroundColor,
            ),
            child: const Icon(Icons.add, size: 40),
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: ConvexAppBar(
      shadowColor: HexColor("#E3E3E3"),
      elevation:10,
      
      backgroundColor: primaryColor,
      color: noAction,
      activeColor: withAction,
      style: TabStyle.fixedCircle,
      height: 60,
      curveSize: 100,
      top: -25,
      cornerRadius: 30,
      items: const [
        TabItem(icon: Icons.book, title: ''),
        TabItem(icon: Icons.add, title: ''),
        TabItem(icon: Icons.bar_chart, title: ''),
       ],
       onTap: _changeItem,
      )
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const CalculateBMIScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
    const begin = Offset(0.0, 0.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
   },
  );
}