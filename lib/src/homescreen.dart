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

        actions: <Widget>[
        IconButton(
            icon: Icon(
            Icons.unfold_more_sharp,
            color:  Color(0xff3943B7),
          ),
          onPressed: () {
            
          },
          )
        ],

        foregroundColor:  Color(0xff3943B7),
        backgroundColor: Color(0xffffffff),
        title:  const Text('Collectify'),
      ),

      backgroundColor: Colors.white,

      drawer: Drawer(
      
      backgroundColor: Color(0xffffffff),
        
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
        tileColor: Color(0xff3943B7),
        iconColor: Color(0xffffffff),
        textColor: Color(0xffffffff),

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
          
        elevation: 8,
        backgroundColor:  Color(0xff3943B7),
        child: const Icon(Icons.add),
        onPressed: () {
        },
        
        ),

        bottomNavigationBar: BottomAppBar(

        color: Color(0xffffffff),

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


