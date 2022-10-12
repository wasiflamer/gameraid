

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:collectify/src/add_game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_helper.dart';


import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class showlist extends StatefulWidget {
   showlist({super.key , required this.gameinfo_model ,  required this.search_term });
   late  dynamic gameinfo_model ;
   late  dynamic search_term ;


  @override
  State<showlist> createState() => _showlistState();
}

class _showlistState extends State<showlist> {


  @override
  Widget build(BuildContext context) {


    String replace_cover = widget.gameinfo_model.cover_url.replaceFirst(RegExp('t_thumb'), 't_cover_big'); 
    String Game_Cover    = ('https:$replace_cover');
    var matched_results  = widget.gameinfo_model.toString().length;

    
    
    return Container(

      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("images/background/pattern_2/image.jpg"),
      fit: BoxFit.cover,
    
      ),
      ),


      child: Scaffold(

          appBar: AppBar(

          titleTextStyle: TextStyle(color:  Color(0xff3943B7), fontSize: 20 , fontFamily: 'Russo One',),

          foregroundColor: const  Color(0xff3943B7),
          backgroundColor: const  Color(0xffffffff),
          title:  Text(widget.search_term.toUpperCase()),
          ),

          backgroundColor: Colors.white,

          bottomNavigationBar: BottomAppBar(

          color: const Color(0xffffffff),

          elevation: 8,
          child: Container(height: 40.0),
          ),

            extendBody: true,

            body: GridView.builder(

                            gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                           
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 270,
                      
                            ),

                            itemCount: matched_results,
                            itemBuilder: (BuildContext context, index) {
                        
                              return Card(

                              elevation: 6,

                              // card style
                              margin:  const EdgeInsets.only(top: 10, left: 9, right: 9),           
                              color:   Colors.white,                   
                              shape:   const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20,20)),
                              ),
              

                                child: Container(

                                  decoration: BoxDecoration(

                                    borderRadius:BorderRadius.all(Radius.elliptical(20,20)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                                      image: NetworkImage(
                                        Game_Cover,
                                      ),
                                    ),
                                  ),

                                  child: Align(
                                    alignment: FractionalOffset.bottomCenter,

                                    child: ListTile(
                                      
                                      contentPadding: EdgeInsets.only(bottom: 10 , left: 10 , right: 10),
                                       
                                      textColor: Color.fromARGB(255, 249, 249, 250),
             
                                       subtitle: Container(

                                       padding: EdgeInsets.only(left: 10 , right: 10 , bottom: 10 , top: 10),

                                       decoration: BoxDecoration(

                                       color: Color.fromARGB(202, 57, 67, 183),
                                       borderRadius:  BorderRadius.all(Radius.elliptical(15,15)),
                                        ),

                                      child:  Text(widget.gameinfo_model.name,
                                       overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                         style: TextStyle( fontFamily: 'Mulish-Bold', fontSize: 18,)),

                                      ),
                                    ),
                                  ),


                              ),
                              );
                            }), 
              ),
        );
    }
}
