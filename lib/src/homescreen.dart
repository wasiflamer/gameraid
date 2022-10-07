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

      home: Scaffold(appBar: AppBar(
        title:  const Text('Collectigy Homescreen'),
      ),

      drawer: const Drawer(backgroundColor: Colors.grey),

      
      
      ),
    );
  }
}


