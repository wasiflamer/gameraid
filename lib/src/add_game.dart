

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

                  Padding(padding: EdgeInsets.only(left: 7 , right: 7 , top: 10),
                  
                      child: Card(

                      margin: EdgeInsets.only(left: 7, right: 7, top: 10 ),

                      color: Color(0xff3943B7), 
                      surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(20,20))),

                      child: ListTile(   

                      iconColor: Colors.white,
                      textColor: Colors.white,
                      
                      dense: true,
                     
                      leading: Padding(padding: EdgeInsets.only(left: 7 , right: 7 , top: 7),
                      child: Icon(Icons.search , size: 30,),),
                      title: TextField(

                      // keyboard Button action 
                      textInputAction: TextInputAction.next,

                      // text style
                      style: TextStyle(color: Colors.white, fontSize: 22 , fontFamily: 'Mulish-Bold' , decoration: TextDecoration.none, decorationColor: Color(0xff3943B7),),

                      // cursor
                      cursorColor: Colors.white,
                      cursorHeight: 27,
                      cursorRadius: Radius.elliptical(20,20),
                      cursorWidth: 2.0,
                      autofocus: true,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,

                      decoration: InputDecoration(

                      hintText: 'Name', 
                      hintStyle: TextStyle(color: Color.fromARGB(76, 255, 255, 255) , fontSize: 22 , fontFamily: 'Mulish-Bold', decoration: TextDecoration.none),   

                      border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                      ),

                      ),

                      controller: titleController,

                      onEditingComplete: () {

                        // show a list of games returned by the api 
                        

                        
                      },

                      ),
                   
                     ),
                  
                    )
                  ),
                ],
                ),
              ),
            ),
          ), 
      );
  }
}