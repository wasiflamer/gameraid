

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
          title:  Text(widget.search_term),
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
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 240,
                      
                            ),

                            itemCount: matched_results,
                            itemBuilder: (BuildContext context, index) {
                        
                              return Card(

                              elevation: 6,
                
                              // card style
                              margin:  const EdgeInsets.only(top: 9 , left: 9 , right: 9),           
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
                                       
                                      textColor: Color(0xff3943B7),
                                       
                                       subtitle: Container(

                                       decoration: BoxDecoration(
                                       
                                       color: Color.fromARGB(255, 255, 255, 255),

                                       borderRadius:  BorderRadius.all(Radius.elliptical(8,8)),
                                       
                                        ),


                                         child: RatingBar.builder(

                                          itemSize: 20,
                                       
                                          ignoreGestures: true,
                                          unratedColor: Colors.grey,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color(0xff3943B7),
                                           
                                          ),
                                          onRatingUpdate: (rating) {
                                           
                                          },
                                      ),
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
