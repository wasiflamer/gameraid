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

      backgroundColor: Colors.white,

      drawer: Drawer(
      
      backgroundColor: Colors.green.shade400,
        
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
          child: null,
        ),
      

      ListTile(

        // colors 
        tileColor: Colors.white,
        iconColor: Color(0xff242525),
        textColor: Color(0xff242525),

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
        elevation: 0,
        backgroundColor: Colors.green,
        child: const Icon(Icons.library_add_rounded),
        onPressed: () {
        },
        
        ),

        bottomNavigationBar: BottomAppBar(

        color: Color(0xff242424),
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        elevation: 0,
        child: Container(height: 40.0),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        extendBody: true,


          body: Container(           
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/background/pattern_1/image.jpg"),
            fit: BoxFit.cover,
            ),
            ),
          ),

      
      ),
    );
  }
}


