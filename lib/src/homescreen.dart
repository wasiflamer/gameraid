// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(appBar: AppBar(
        backgroundColor: Colors.green,
        title:  const Text('Collectify'),
      ),


      drawer: const Drawer(
        backgroundColor: Colors.blueGrey),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.library_add_rounded),
        onPressed: () {
      },
      ),

      
      
      ),
    );
  }
}


