

// ignore_for_file: prefer_const_constructors, unused_import, camel_case_types, unused_local_variable, use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collectify/src/databaseclass_wishlist.dart';
import 'package:collectify/src/game_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';


final Widget png = Image.asset('images/hero2.jpg' , width: 300 , height: 100 );


class whishlist extends StatefulWidget {
  const whishlist({super.key});

  @override
  State<whishlist> createState() => _whishlistState();
}

class _whishlistState extends State<whishlist> {


   // keep tracks of total games
   late int avail_games ;

    /*----------- stream controller -----------------------*/

    final StreamController _streamController = StreamController();
    late Timer _timer;

    dynamic getData() async {

    dynamic data =  await DatabaseHelper_wishlist.instance.fetchnote_wishlist();
    avail_games  =  data.length; 
    
    //Add your data to stream
    _streamController.add(data);
    
  }

  @override
  void initState()  {
    getData();

    //Check the database every 5 Minutes
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => getData());
 

    super.initState();

  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // [for method two cover fetch ]
    String prefix = ('https:');

    return Scaffold(
      
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      extendBody: true,
    
      body: Center(
        child: StreamBuilder(
                   stream: _streamController.stream,
                   builder: ( BuildContext context, AsyncSnapshot snapshot) 
                   {
                   
                    if (snapshot.connectionState == ConnectionState.waiting)
                    {
                      return const CircularProgressIndicator(color: Color(0xff3d405b),);   	
                    }
                    else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done)
                    {
                      
                        // if data is empty 
                        if ( avail_games == 0 )
                        {

                            return Center(
                              child: png ,                
                          
                            );
             
                            
                        }

                        if (snapshot.hasError) 
                        {
                            return  Center(child: Text('Error'));   
                        } 
                        else if (snapshot.hasData)
                        {



                            return GridView.builder(

                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 0,
                            maxCrossAxisExtent:300,
                            mainAxisExtent: 270,
                      
                            ),

                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index)  {

                                        
                              return GestureDetector(
                
                              onTap: () async {

                               var game_identifier = int.parse(snapshot.data[index]['game_id'].toString()); 

                               // videos response              
                                var response = await post(Uri.parse('https://api.igdb.com/v4/game_videos'),
                                headers: {

                                "Client-ID": "qy0014f6bb0s49s8iffaxs9fu05v1s",
                                "Authorization": "Bearer oxjo6d02h5kdrgj4qwtl52nt644d3f  "

                                }, 
                                
                                body: 'fields video_id ; limit 1 ; where game = $game_identifier;',

                                );        

                                  
                                // parse the video id  
                                var parsed_video_id = json.decode(response.body);


                                // now in here we have a list-strings of genres that we need to convert to list and set it to mad king 

                                final splitted_genres = snapshot.data[index]['genres'].toString().split(',');


                                // fetch genres 
                                String genres_joined ;
                                List mad_king = [] ;

                                if ( snapshot.data[index]['genres'] != null )
                                { 

                                      genres_joined = snapshot.data[index]['genres'].toString();
                                      mad_king = splitted_genres ; 

                                }
                                else
                                {
                                      genres_joined = 'To be Added.';
                                      mad_king.add('To be Added.');
                                      

                                }


                                // ----------------------------//


                                // fetch screen shots 
                                var ss_list = [];

                                final splitted_ss = snapshot.data[index]['screenshots'].toString().split(',');

                              
                                if ( snapshot.data[index]['screenshots'] != null )
                                {
                                   
                                     ss_list = splitted_ss ; 
                                }
                               
                              

                                // fetch ratings
                                double star_rating = 0 ; 
                                String verdict = '';

                                if ( snapshot.data[index]['total_rating'] != null )
                                {

                                   double ratings_game = snapshot.data[index]['total_rating'];

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

                                debugPrint(snapshot.data[index]['platforms'].toString());

                                if ( snapshot.data[index]['platforms'] != null )
                                { 

                                      platforms_joined = snapshot.data[index]['platforms'].toString();
                                     

                                }
                                else
                                {
                                      platforms_joined = 'To be Added.';

                                }

                                // fetch shared preferences results 
                                SharedPreferences pre = await SharedPreferences.getInstance();
                                String game_status = pre.getString(snapshot.data[index]['game_id'].toString()) ?? ""; 


                                List<dynamic> mylist = parsed_video_id;

                                // if no video found then send cover to the details screen instead
                                if(mylist.isEmpty)
                                {
                                    
                                      String year_only ;

                                      if (snapshot.data[index]['first_release_date'] != null)
                                      {

                                        // fetching date
                                        String unix_date = snapshot.data[index]['first_release_date'].toString(); 
                                        String fulldate  = DateTime.fromMillisecondsSinceEpoch(int.parse(unix_date) * 1000, isUtc: true).toString();
                                        year_only = fulldate.substring(0,4);
                                        
                                      }
                                      else
                                      {
                                        year_only = 'Release Year Unknown';
                                      }

                                      int video_is_present = 1;

                                      // fetching summary
                                      String summary = snapshot.data[index]['summary'].toString();

                                    
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(

                                        // cover url
                                        general_id       : snapshot.data[index]['cover_link'].toString(),
                                        video_is_present : video_is_present,

                                        game_name    : snapshot.data[index]['game_name'].toString(),
                                        release_year : snapshot.data[index]['release_year'].toString(),
                                        summary      : snapshot.data[index]['summary'].toString(),
                                        platforms    : platforms_joined, 
                                        ratings      : snapshot.data[index]['ratings'],
                                        game_verdict : snapshot.data[index]['game_verdict'].toString(),
                                        screenshots  : ss_list,
                                        genres       : genres_joined,
                                        mad_king     : mad_king,
                                        game_id      : snapshot.data[index]['game_id'],

                                        game_status  : game_status ,

                                        cover_link   : snapshot.data[index]['cover_link'].toString(),
                                       
                                        
                                        )
                                        )
                                      );  

                                } 
                                else 
                                {

                                    int video_is_present = 0 ;

                                      // fetching date
                                      String year_only ;

                                      if (snapshot.data[index]['first_release_date'] != null)
                                      {

                                        // fetching date
                                        String unix_date = snapshot.data[index]['first_release_date'].toString(); 
                                        String fulldate  = DateTime.fromMillisecondsSinceEpoch(int.parse(unix_date) * 1000, isUtc: true).toString();
                                        year_only = fulldate.substring(0,4);
                                        
                                      }
                                      else
                                      {
                                        year_only = 'Release Year Unknown';
                                      }


                                    // fetching summary
                                    String summary = snapshot.data[index]['summary'].toString();

                                    var video_id = parsed_video_id[0]['video_id'].toString(); 
                                    // send video to details page 
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => game_details(
                                        // video id 
                                        general_id: video_id,
                                        video_is_present: video_is_present ,

                                        game_name    : snapshot.data[index]['game_name'].toString(),
                                        release_year : snapshot.data[index]['release_year'].toString(),
                                        summary      : snapshot.data[index]['summary'].toString(),
                                        platforms    : platforms_joined, 
                                        ratings      : snapshot.data[index]['ratings'],
                                        game_verdict : snapshot.data[index]['game_verdict'].toString(),
                                        screenshots  :  ss_list,
                                        genres       : genres_joined,
                                        mad_king     : mad_king,

                                        game_id      : snapshot.data[index]['game_id'],

                                        game_status  : game_status,

                                        cover_link   : snapshot.data[index]['cover_link'].toString(),
                                      
                                        
                                        )
                                        )
                                      );    

                                }

                             },


                             onLongPress: () async {

                                // remove from shared preferences 
                                SharedPreferences pre = await SharedPreferences.getInstance();
                                pre.setString(snapshot.data[index]['game_id'].toString(), "Null");
                                
                                // remove from database 
                                DatabaseHelper_wishlist.instance.deletenote_wishlist(int.parse(snapshot.data[index]['game_id'].toString()));

                                // delete cover to save space . 
                                deleteFile_wishlist(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${snapshot.data[index]['game_id']}.jpg'));

                             },
                  
    
                                child: Card ( 
                              
                                elevation: 8,
        
                                // card style
                                margin:  const EdgeInsets.only(top: 10, left: 9, right: 9),           
                                color:   Colors.white,                   
                                shape:   const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.elliptical(10,10)),
                                ),
                              
                                child: Container(
                                               
                                    decoration: BoxDecoration(
                              
                                      border: Border.all(width: 3.0, color: const Color.fromARGB(255, 0, 0, 0) , strokeAlign: BorderSide.strokeAlignInside),            
                                      borderRadius: const BorderRadius.all(Radius.elliptical(10,10)),
                                      
                                      image: DecorationImage(
                                        fit: BoxFit.cover,                       
                                        filterQuality: FilterQuality.high,
                                        isAntiAlias: true,
                                        image: FileImage(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${snapshot.data[index]['game_id']}.jpg')),
                                      ),
                                                          
                                    ),
                                                          
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                                          
                                      child: ListTile(     
                              
                                        
                                        contentPadding: const EdgeInsets.only(bottom: 10 , left: 10 , right: 10),                                       
                                        // textColor:Color(0xff3d405b),
                                           textColor: Colors.white,
                                         
                                                        
                                         subtitle: Container(
                                         padding: const EdgeInsets.only(left: 9 , right: 9 , bottom: 10 , top: 10),
                                                          
                                         decoration: const BoxDecoration(
                                                          
                                            color: Color(0xff3d405b),
                                            //color: Color.fromARGB(192, 57, 67, 183),
                                            borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                                          ),
                                                          
                                        child:  Text(snapshot.data[index]['game_name'],
                                         overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                           style: const TextStyle( fontFamily: 'Mulish-Bold', fontSize: 15,)),
                                                          
                                        ),
                                      ),
                                    ),
                                                          
                                ),
                                ),                                 
                              );
                            
                                         
                            });
                            
                            }  
                        
                        }
                      
                    // something else is happaning !
                    return const CircularProgressIndicator(color: Color(0xff3d405b),);
                  },

                ), 
      
        ),

    );
  }
}