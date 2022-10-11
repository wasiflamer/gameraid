

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:collectify/src/show_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_helper.dart';

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
                      

                      onEditingComplete: () async {

                        var  TitleName = titleController.text; 

                        // show a list of games returned by the API
                        
                        var response = await post(Uri.parse('https://api.igdb.com/v4/games'),
                        headers: {

                        "Client-ID": "qy0014f6bb0s49s8iffaxs9fu05v1s",
                        "Authorization": "Bearer vrzwedsndtzt2go6gp4yiy21114yzh"
                        },
                        
                        body: 'search "$TitleName"; fields name, cover, cover.url , storyline ; limit 10; where storyline != null ;',
                        );

                        var parsedJson  = json.decode(response.body);

                        debugPrint(parsedJson.toString());
                                 
                        
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


        floatingActionButton: FloatingActionButton(
          
          onPressed: () {

            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const showlist()),
            );
          
          },

          child: Icon(Icons.next_plan),
        
        ),







      );
  }
}