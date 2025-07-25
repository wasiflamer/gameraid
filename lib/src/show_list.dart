

// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, unused_import, unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:collectify/src/add_game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'game_details.dart';


import 'package:shared_preferences/shared_preferences.dart';

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

        titleTextStyle: TextStyle(color:  Color(0xffe07a5f), fontSize: 20 , fontFamily: 'Mulish-Bold',),

        foregroundColor: Color(0xffe07a5f),
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
                          mainAxisSpacing: 8,
                          mainAxisExtent: 270,
                    
                          ),

                          itemCount: matched_results,
                          itemBuilder: (BuildContext context, index) {
    
                            return GestureDetector(

                              onTap: () async {

                               var game_identifier = int.parse(widget.rawdata[index]['id'].toString()); 

                               // videos response              
                               var response = await post(Uri.parse('https://api.igdb.com/v4/game_videos'),
                                headers: {

                                "Client-ID": "qy0014f6bb0s49s8iffaxs9fu05v1s",
                                "Authorization": "Bearer oxjo6d02h5kdrgj4qwtl52nt644d3f "

                                }, 
                                
                                body: 'fields video_id ; limit 1 ; where game = $game_identifier;',

                                );        

                                  
                                // parse the data 
                                var parsed_video_id = json.decode(response.body);


                                // fetch genres 
                                String genres_joined ;
                                List mad_king = []   ;

                                if ( widget.rawdata[index]['genres'] != null )
                                { 

                                      List raw_genres = widget.rawdata[index]['genres']; 
                                      var genres_list = [];
                  
                                      for (int i = 0 ; i <  int.parse(raw_genres.length.toString()); i++)
                                      {                       
                                          genres_list.add(raw_genres[i]['name'].toString());
                                      }

                                       genres_joined = genres_list.join(',');
                                       mad_king = genres_list;

                                }
                                else
                                {
                                      genres_joined = 'To be Added.';
                                      mad_king.add('To be Added.');
                                      

                                }


                                // ----------------------------//


                                // fetch screen shots 
                                var ss_list = [];
                               
                                if ( widget.rawdata[index]['screenshots'] != null )
                                {
                                   
                                      List raw_ss = widget.rawdata[index]['screenshots']; 
                  
                                      for (int i = 0 ; i <  int.parse(raw_ss.length.toString()); i++)
                                      {                       
                                          ss_list.add(raw_ss[i]['image_id'].toString());
                                      }
                                }
                               
                              

                                // fetch ratings
                                double star_rating = 0 ; 
                                String verdict = '';

                                if ( widget.rawdata[index]['total_rating'] != null )
                                {

                                   double ratings_game = widget.rawdata[index]['total_rating'];

                                   int simple_rating = ratings_game.round();

                                   if ( simple_rating <= 10 ) {

                                      star_rating = 0.5 ;
                                      verdict = 'Worst !' ;
                                     
                                   }
                                   else if ( simple_rating <= 20 ) {

                                      star_rating = 1 ;
                                      verdict = 'Poor !';


                                   }
                                    else if ( simple_rating <= 30 ) {

                                      star_rating = 1.5 ;
                                      verdict = 'Terrible !';


                                   }
                                    else if ( simple_rating <= 40 ) {

                                      star_rating = 2 ;
                                      verdict = 'Plain Bad !';

                                   }
                                    else if ( simple_rating <= 50 ) {

                                      star_rating = 2.5 ;
                                      verdict = 'Unpleasant !';


                                   }
                                    else if ( simple_rating <= 60 ) {

                                      star_rating = 3 ;
                                      verdict = "It's okay !";


                                   }
                                   else if ( simple_rating <= 70 ) {

                                      star_rating = 3.5 ;
                                      verdict = "Pretty Decent !";


                                   }
                                    else if ( simple_rating <= 80 ) {

                                      star_rating = 4 ;
                                      verdict = "Superb !";


                                   }
                                    else if ( simple_rating <= 90 ) {

                                      star_rating = 4.5 ;
                                      verdict = "Fantastic !";


                                   }
                                    else if ( simple_rating <= 100 ) {

                                      star_rating = 5 ;
                                      verdict = "Outstanding !";

                                   }

                                }
                                else
                                {

                                  star_rating = 0 ; 
                                  verdict = "Not Rated Yet !";
                                }
                               

                                //  fetch platforms
                                String platforms_joined ;

                                if ( widget.rawdata[index]['platforms'] != null )
                                { 

                                     
                                      List raw_platforms = widget.rawdata[index]['platforms']; 
                                      var platforms_list = [];
                  
                                      for (int i = 0 ; i <  int.parse(raw_platforms.length.toString()); i++)
                                      {                       
                                          platforms_list.add(raw_platforms[i]['name'].toString());
                                      }

                                       platforms_joined = platforms_list.join(',');

                                }
                                else
                                {
                                      platforms_joined = 'To be Added.';

                                }

                                // fetch shared preferences results 
                                SharedPreferences pre = await SharedPreferences.getInstance();
                                String game_status = pre.getString(widget.rawdata[index]['id'].toString()) ?? "Null"; 


                                List<dynamic> mylist = parsed_video_id;

                                // if no video found then send cover to the details screen instead
                                if(mylist.isEmpty)
                                {
                                    
                                      String year_only ;

                                      if (widget.rawdata[index]['first_release_date'] != null)
                                      {

                                        // fetching date
                                        String unix_date = widget.rawdata[index]['first_release_date'].toString(); 
                                        String fulldate  = DateTime.fromMillisecondsSinceEpoch(int.parse(unix_date) * 1000, isUtc: true).toString();
                                        year_only = fulldate.substring(0,4);
                                        
                                      }
                                      else
                                      {
                                        year_only = 'Release Year Unknown';
                                      }

                                      int video_is_present = 1;

                                      // fetching summary
                                      String summary = widget.rawdata[index]['summary'].toString();

                                    
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(

                                        // cover url
                                        general_id       : widget.rawdata[index]['cover']['url'].toString(),
                                        video_is_present : video_is_present,

                                        game_name    : widget.rawdata[index]['name'].toString(),
                                        release_year : year_only,
                                        summary      : summary, 
                                        platforms    : platforms_joined, 
                                        ratings      : star_rating,
                                        game_verdict : verdict,
                                        screenshots  :  ss_list,
                                        genres       : genres_joined,
                                        mad_king     : mad_king,

                                        game_id      : widget.rawdata[index]['id'],

                                        game_status  : game_status,

                                        cover_link   : widget.rawdata[index]['cover']['url'].toString(),
                                       
                                        
                                        )
                                        )
                                      );  

                                } 
                                else 
                                {

                                    int video_is_present = 0 ;

                                      // fetching date
                                      String unix_date = widget.rawdata[index]['first_release_date'].toString(); 
                                      String fulldate  = DateTime.fromMillisecondsSinceEpoch(int.parse(unix_date) * 1000, isUtc: true).toString();
                                      String year_only = fulldate.substring(0,4);


                                    // fetching summary
                                    String summary = widget.rawdata[index]['summary'].toString();

                                    var video_id = parsed_video_id[0]['video_id'].toString(); 
                                    // send video to details page 
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(
                                        // video id 
                                        general_id: video_id,
                                        video_is_present: video_is_present ,

                                        game_name    : widget.rawdata[index]['name'].toString(),
                                        release_year : year_only,
                                        summary      : summary, 
                                        platforms    : platforms_joined, 
                                        ratings      : star_rating,
                                        game_verdict : verdict,
                                        screenshots  :  ss_list,
                                        genres       : genres_joined,
                                        mad_king     : mad_king,

                                        game_id      : widget.rawdata[index]['id'],

                                        game_status  : game_status,

                                        cover_link   : widget.rawdata[index]['cover']['url'].toString(),
                                      
                                        
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

                                    border: Border.all(width: 3.0, color: Color.fromARGB(255, 0, 0, 0), strokeAlign: BorderSide.strokeAlignInside),
                            
                                    borderRadius:BorderRadius.all(Radius.elliptical(10,10)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,                       
                                      filterQuality: FilterQuality.high,
                                      isAntiAlias: true,
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
                                      // textColor:Color(0xff3d405b),
                                         textColor: Colors.white,
                                       
                          
                                       subtitle: Container(
                                       padding: EdgeInsets.only(left: 9 , right: 9 , bottom: 10 , top: 10),
                            
                                       decoration: BoxDecoration(
                            
                                          color: Color(0xff3d405b),
                                          //color: Color.fromARGB(192, 57, 67, 183),
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
