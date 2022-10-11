

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:convert';

import 'package:collectify/src/add_game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_helper.dart';

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

          backgroundColor: Color.fromARGB(255, 248, 248, 248),

          bottomNavigationBar: BottomAppBar(

          color: const Color(0xffffffff),

          elevation: 8,
          child: Container(height: 40.0),
          ),

            extendBody: true,

            body: ListView.builder(

                    padding: EdgeInsets.only(left: 7 , right: 7),

                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    itemCount: matched_results,
                    itemBuilder: (BuildContext context, int index) {

                    return Card(  

                    elevation: 6,

                    // card style
                     margin:  const EdgeInsets.only(top: 25 , left: 7 , right: 7),           
                     
                     color:  Color(0xff3943B7),                  
                     shape:   const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.elliptical(20,20))),
                     
                      child: ListTile(

                        
                       tileColor: Color(0xff3943B7),
                       minVerticalPadding: 10,
                       contentPadding: EdgeInsets.all(10),
                       minLeadingWidth: 90,
                       shape:const RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.elliptical(15,15)),
                       ),


                       iconColor:  Colors.white,
                       textColor:  Colors.white,
                       isThreeLine: true,

                       leading: SizedBox( height: 200, width:200, child: Image.network(Game_Cover , height: 200, width: 200,)) ,
                 
                        title: Text(widget.gameinfo_model.name, maxLines: 3, overflow: TextOverflow.fade, style:  TextStyle(fontSize: 18, fontFamily: 'Mulish-Bold', )),
                        subtitle: Text(widget.gameinfo_model.story_line, maxLines: 4, overflow: TextOverflow.fade, style:  TextStyle(fontSize: 16, fontFamily: 'Mulish',)),
                      
                      
                       ),
                    );
                 }), 
              ),
        );
    }
}
