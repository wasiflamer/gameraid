

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class add_game extends StatefulWidget {
  const add_game({super.key});

  @override
  State<add_game> createState() => _add_gameState();
}

class _add_gameState extends State<add_game> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      title: 'Collectify',

      debugShowCheckedModeBanner: false,

      home: Scaffold(appBar: AppBar(

        foregroundColor: const  Color(0xff3943B7),
        backgroundColor: const  Color(0xffffffff),
        title:  const Text('Fetch Game'),
      ),

        backgroundColor: Colors.white,

        bottomNavigationBar: BottomAppBar(

        color: const Color(0xffffffff),

        elevation: 4,
        child: Container(height: 40.0),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        extendBody: true,

          body: Container(           
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/background/pattern_2/image.jpg"),
            fit: BoxFit.cover,
            ),
            ),
          ),
 
      ),
    );
  }
}