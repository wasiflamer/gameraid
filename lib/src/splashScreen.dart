


// ignore_for_file: library_private_types_in_public_api

import 'dart:async'; 
import 'package:flutter/material.dart';
import 'homescreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( const
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  const homescreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(

         decoration: const BoxDecoration(
          color: Colors.white,

          ),

        //logo image 
        
        child: Center(
          child: Image.asset('images/logo.png', height: 320),
        ),
      ),
    );
  }
}