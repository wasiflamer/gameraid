// ignore_for_file: camel_case_types, prefer_const_constructors

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

      backgroundColor: Color(0xff02111B),

      drawer: Drawer(


        
      
      backgroundColor: Colors.blueGrey,
        
      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [

       DrawerHeader(
        decoration: BoxDecoration(
         image: DecorationImage(
                  image: AssetImage('images/logo.jpg'),
                     fit: BoxFit.cover)
              ),
          child: null ,
        ),
      

      ListTile(

        // colors 
        tileColor: Colors.white,
        iconColor: Colors.amber,
        textColor: Colors.black,

        // icon 
        leading: const Icon(Icons.games_sharp),

        // text
        title: const Text('Collected Games'),

        // back_end handle
        onTap: () {
         
        },

           ),
         ],
        ),   
        
        ),


        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.library_add_rounded),
        onPressed: () {
        },
        
        ),


        body:  Container(
          child: 
          Center( 
            child: Text('List view Here !'),
          )),

      
      ),
    );
  }
}


