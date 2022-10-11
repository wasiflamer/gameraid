

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_helper.dart';

class showlist extends StatefulWidget {
  const showlist({super.key});

  @override
  State<showlist> createState() => _showlistState();
}

class _showlistState extends State<showlist> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        resizeToAvoidBottomInset: false,

        appBar: AppBar(

        titleTextStyle: TextStyle(color:  Color(0xff3943B7), fontSize: 20 , fontFamily: 'Russo One',),

        foregroundColor: const  Color(0xff3943B7),
        backgroundColor: const  Color(0xffffffff),
        title:  const Text('Placeholder'),
        ),

        backgroundColor: Colors.white,

        bottomNavigationBar: BottomAppBar(

        color: const Color(0xffffffff),

        elevation: 4,
        child: Container(height: 40.0),
        ),

          extendBody: true,

          body: Container(           
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/background/pattern_2/image.jpg"),
            fit: BoxFit.cover,
          
            ),
            ),

            child: Center(child: Text('dd')),
          ), 
      );
  }
}