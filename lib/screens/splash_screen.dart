import 'dart:async';
import 'package:befit/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  final Color accentColor = HexColor("#54D0BC");
  final Color primaryColor = HexColor("#54D0BC");

  _SplashScreenState(){
    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyHomePage()), (route) => false);
      });
    });

     Timer(
      const Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [accentColor, primaryColor],
          begin: const FractionalOffset(1, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: const Center(
          child: SizedBox(
            height: 500.0,
            width: 500.0,
            child: Center(
              child: Icon(Icons.track_changes, size: 1000, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}