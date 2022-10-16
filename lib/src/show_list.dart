

// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, unused_import, unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:collectify/src/add_game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'game_details.dart';

class showlist extends StatefulWidget {
   showlist({super.key, required this.search_term, required this.returned_rows, required this.rawdata });
   late  dynamic search_term ;
   late  dynamic returned_rows;
   late  dynamic rawdata;

  @override
  State<showlist> createState() => _showlistState();
}

class _showlistState extends State<showlist> {


  @override
  Widget build(BuildContext context) {

    // how many cards to show
    var matched_results  = widget.returned_rows;

    // [method 1 cover fetch ]
    // repalce multiples covers and add them into a list
    var list_of_covers = [];

    for (int i = 0 ; i < matched_results ; i++)
    {
    
      // get first url 
      String current_url =  widget.rawdata[i]['cover']['url'];
      
      // change it to cover
      
      String big_got = current_url.replaceFirst(RegExp('t_thumb'), 't_720p');
      //String big_got = current_url.replaceFirst(RegExp('t_thumb'), 't_cover_big');
      String actual_cover = ('https:$big_got'); 

      // add to new list 
      list_of_covers.add(actual_cover);

    }

     
    // [for method two cover fetch ]
    // String prefix = ('https:');

    
    return Scaffold(

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
    
                            return GestureDetector(

                              onTap: () async {

                               var game_identifier = int.parse(widget.rawdata[index]['id'].toString()); 

                                            
                               var response = await post(Uri.parse('https://api.igdb.com/v4/game_videos'),
                                headers: {

                                "Client-ID": "qy0014f6bb0s49s8iffaxs9fu05v1s",
                                "Authorization": "Bearer vrzwedsndtzt2go6gp4yiy21114yzh"

                                }, 
                                
                                body: 'fields video_id ; limit 1 ; where game = $game_identifier;',

                                );         
                                  
                                // parse the data 
                                var parsed_video_id = json.decode(response.body); 

                                List<dynamic> mylist = parsed_video_id;

                                // if no video found then send cover to the details screen instead
                                if(mylist.isEmpty)
                                {

                                  debugPrint('yes no video was found ');

                                  int video_is_present = 1 ;


                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(
                                        // cover url
                                        general_id: widget.rawdata[index]['cover']['url'].toString(),
                                        video_is_present: video_is_present ,
                                        
                                        )
                                        )
                                      );  

                                


                                } 
                                else 
                                {

                                    int video_is_present = 0 ;

                                    var video_id = parsed_video_id[0]['video_id'].toString(); 
                                    // send video to details page 
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(
                                        // video id 
                                        general_id: video_id,
                                        video_is_present: video_is_present ,
                                        
                                        )
                                        )
                                      );    

                                }

                             },

                              child: Card(
                            
                              elevation: 10,
                          
                              // card style
                              margin:  const EdgeInsets.only(top: 10, left: 9, right: 9),           
                              color:   Colors.white,                   
                              shape:   const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(10,10)),
                              ),
                                          
                            
                                child: Container(
                            
                                  decoration: BoxDecoration(

                                    border: Border.all(width: 3.0, color: Color.fromARGB(255, 0, 0, 0) , strokeAlign: StrokeAlign.inside),
                            
                                    borderRadius:BorderRadius.all(Radius.elliptical(10,10)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,                       
                                      filterQuality: FilterQuality.high,
                                      image: NetworkImage(

                                      // [first method ] , fast fetch
                                      list_of_covers[index],
                                    
                                      // [second method ] slow fetch 
                                      // prefix + widget.rawdata[index]['cover']['url'].replaceFirst(RegExp('t_thumb'), 't_cover_big')
                            
                                      ),
                                    ),
                            
                                  ),
                            
                                  child: Align(
                                    alignment: FractionalOffset.bottomCenter,
                            
                                    child: ListTile(     
                                      
                                      contentPadding: EdgeInsets.only(bottom: 10 , left: 10 , right: 10),                                       
                                       textColor:Color(0xff3943B7),
                                      // textColor: Colors.white,
                                      
                                       subtitle: Container(
                                       padding: EdgeInsets.only(left: 9 , right: 9 , bottom: 10 , top: 10),
                            
                                       decoration: BoxDecoration(
                            
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        // color: Color.fromARGB(192, 57, 67, 183),
                                          borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                                        ),
                            
                                      child:  Text(widget.rawdata[index]['name'],
                                       overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                         style: TextStyle( fontFamily: 'Mulish-Bold', fontSize: 15,)),
                            
                                      ),
                                    ),
                                  ),
                            
                              ),
                              ),
                            );
                          }), 
            );
    }
}
