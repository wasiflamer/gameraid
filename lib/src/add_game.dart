

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

      resizeToAvoidBottomInset: false,

        appBar: AppBar(

        titleTextStyle: TextStyle(color:  Color(0xff3943B7), fontSize: 20 , fontFamily: 'Russo One',),

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
                padding: EdgeInsets.only(left: 24 , right: 24 , top: 25),
                
                  // title textfield
                  child: TextField(

                  // keyboard Button action 
                  textInputAction: TextInputAction.next,

                  // text style
                  style: TextStyle(color: Colors.white , fontSize: 22 , fontFamily: 'Mulish-Bold'),

                  // cursor
                  cursorColor: Colors.white,
                  cursorHeight: 27,
                  cursorRadius: Radius.elliptical(20,20),
                  cursorWidth: 2.0,
                  autofocus: true,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,

                  
                  // border 
                  decoration: InputDecoration(
                  filled: true,
                  fillColor:  Color(0xff3943B7),
              
                  
                  hintText: 'Name', 
                  hintStyle: TextStyle(color: Color.fromARGB(76, 255, 255, 255) , fontSize: 22 , fontFamily: 'Mulish-Bold'),   
                
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                   ),
                  ),
                  
                  // title controller
                  controller: titleController,  
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 25 , right: 0 , top: 0),
                  
                  child: ListTile(

                    leading: Icon(Icons.add),
                    title: Text('Search'),
                    


                 
                  ),



                  )
                  ],
                ),
              ),
            ),
          ),      
      );
  }
}