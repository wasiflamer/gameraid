

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class add_game extends StatefulWidget {
  const add_game({super.key});

  @override
  State<add_game> createState() => _add_gameState();
}

class _add_gameState extends State<add_game> {

   // instance of text_ediitng controllers 
  final titleController   = TextEditingController();
 
   // disposing the controllers
   @override
   void dispose() {
     titleController.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        appBar: AppBar(

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

        extendBody: true,

          body: Container(           
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/background/pattern_2/image.jpg"),
            fit: BoxFit.cover,
            ),
            ),

            child: SingleChildScrollView(
            child: SizedBox(
            width: 400,
            height: 900,
            child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
               Padding(
                padding: EdgeInsets.only(left: 24 , right: 24 , top: 124),
                
                  // title textfield
                  child: TextField(

                  // keyboard Button action 
                  textInputAction: TextInputAction.next,

                  // text style
                  style: TextStyle(color: Colors.white , fontSize: 22 , fontFamily: 'Russo One'),

                  // cursor
                  cursorColor: Colors.white,
                  cursorHeight: 27,
                  cursorRadius: Radius.elliptical(20,20),
                  cursorWidth: 2.0,
                  autofocus: true,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,

                  // border 
                  decoration: InputDecoration(
                  filled: true,
                  fillColor:  Colors.green,
              
                  // label text
                  labelText: 'Title',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelStyle:     const TextStyle(color: Colors.blue, fontSize: 26 , fontFamily: 'Russo One',),
                  floatingLabelBehavior:  FloatingLabelBehavior.always,
                             
                
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only( topLeft:Radius.elliptical(20,20), topRight:Radius.elliptical(20,20)),
                   ),
                  ),
                  
                  // title controller
                  controller: titleController,   

                ),   
                  
                  ),
                  ],
                ),
              ),
            ),

          ),
 
      );
  }
}