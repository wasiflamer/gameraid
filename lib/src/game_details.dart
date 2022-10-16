

// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, non_constant_identifier_names, must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables


import 'dart:ui';

import 'package:collectify/src/add_game.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class game_details extends StatefulWidget {
   game_details({super.key , required this.general_id , required this.video_is_present });
  late  dynamic general_id;
  late  int video_is_present ; 

  @override
  State<game_details> createState() => _game_detailsState();
}

class _game_detailsState extends State<game_details> {

  @override
  Widget build(BuildContext context) {

           
            // the video outcome 

            if ( widget.video_is_present == 0)
            {

                    // ready the player 
                    YoutubePlayerController _controller = YoutubePlayerController(
                    
                    initialVideoId:  widget.general_id.toString(),
                    flags: YoutubePlayerFlags(

                        startAt: 5,
                        autoPlay: true,
                        mute: false,
                        disableDragSeek: true,
                        hideControls: true,
                        loop: true,
                        enableCaption: false,
                        forceHD: true,
                        
                    ),
                  );

                  return Scaffold(

                  backgroundColor: Colors.white,
                  body: CustomScrollView(
                  slivers: <Widget>[
                    //2
                    SliverAppBar(

                      elevation: 10,
                      forceElevated: true,

                      floating: false,
                      pinned: false,
                      snap: false,

                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(

                        background: YoutubePlayer(
                              
                              controller: _controller,

                              controlsTimeOut: Duration(seconds: 0),

                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.blue,
                              progressColors: ProgressBarColors(
                              playedColor: Colors.grey,
                              handleColor: Colors.white,
                              backgroundColor: Colors.white,
                              bufferedColor: Colors.amber,
                    
                          ),
                      ),
                      ),
                    ),
                  ],
                ),
              );

            


            }
            

             // the cover outcome .
           
            String fetched_cover =  widget.general_id.toString() ;
            String retraced = fetched_cover.replaceFirst(RegExp('t_thumb'), 't_1080p');
            String hihicover = ('https:$retraced'); 

             return Scaffold(

              backgroundColor: Colors.white,

             body: DefaultTabController(
             length: 0,
             child: NestedScrollView(

             headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
             return <Widget>[
             SliverAppBar(

             elevation: 8,
             forceElevated: true,
                              
             floating: false,
             pinned: false,
             snap: false,

             backgroundColor: Color(0xff242424),
                  
              expandedHeight: 280.0,
              flexibleSpace: FlexibleSpaceBar(
        
                background: Container(
        
                  decoration:  BoxDecoration(
                  image: DecorationImage(
                  image: NetworkImage(hihicover),
                  fit: BoxFit.cover,
                  opacity: 0.4
                  ),
                  ),
        
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    hihicover,
        
                  ),
                )
        
              ),

              ),
             
            ];
          },
          body: Column(
            children: [

               // title of the game
               ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Bus Driver Simulator',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.blue, fontFamily: 'Mulish-Bold', fontSize: 18)),
                ),
               
                ),

                // summary
                ListTile(


                title: Container(

                  decoration: BoxDecoration(
                                                  
                  color: Color.fromARGB(192, 57, 67, 183),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
                  
                  
                  padding: EdgeInsets.all(10),     
                  child: Text('Description' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),
                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,

                  )
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('lorem ipson itum la man tha kon ibsum wah la ki am'),
                  ),
                ),

                // platforms
                ListTile(
                title: Container(

                  decoration: BoxDecoration(
                                                  
                  color: Color.fromARGB(192, 57, 67, 183),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
     
                  padding: EdgeInsets.all(10),     
                  child: Text('Available On' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),

                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  
                  )
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('PC,XBOX,PLAYSTATION'),
                  ),
                ),

                 // screenshots
                ListTile(
                title: Container(

                  decoration: BoxDecoration(
                                                  
                  color: Color.fromARGB(192, 57, 67, 183),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),

                  padding: EdgeInsets.all(10),     
                  child: Text('ScreenShots' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('1,2,3'),
                  ),
                ),

                // rating 
                ListTile(
                title: Container(

                  decoration: BoxDecoration(
                                                  
                  color: Color.fromARGB(192, 57, 67, 183),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),

                  
                  padding: EdgeInsets.all(10),     
                  child: Text('IGDB Rating' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RatingBar.builder(

                      tapOnlyMode: true,
                      glow: false,
                      ignoreGestures: true,
                      
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                       
                      },
                    ),
                  ) ,

                ),

            ],
          ) ,


        ),
      ),
    );

    }    
  }
  





  











// Scaffold(

//                   backgroundColor: Colors.white,
//                   body: DefaultTabController(

//                     length: 2,
                    
//                     child: CustomScrollView(
//                     slivers: <Widget>[
                     
//                       SliverAppBar(
                  
//                         elevation: 10,
//                         forceElevated: true,
                              
//                         floating: false,
//                         pinned: false,
//                         snap: false,
//                         backgroundColor: Color(0xff242424),
                  
//                         expandedHeight: 300.0,
//                         flexibleSpace: FlexibleSpaceBar(
                  
//                           background: Container(
                  
//                             decoration:  BoxDecoration(
//                             image: DecorationImage(
//                             image: NetworkImage(hihicover),
//                             fit: BoxFit.cover,
//                             opacity: 0.3
//                             ),
//                             ),
                  
//                             child: Image.network(
//                               filterQuality: FilterQuality.high,
//                               hihicover,
                  
//                             ),
//                           )
                  
//                         ),
//                       ),

//                       SliverPersistentHeader(
//                       delegate: _SliverAppBarDelegate(
//                       TabBar(
//                       labelColor: Colors.black87,
//                       unselectedLabelColor: Colors.grey,
//                       tabs: [
//                       Tab(icon: Icon(Icons.info), text: "Tab 1"),
//                       Tab(icon: Icon(Icons.image_sharp), text: "Tab 2"),
//                       ],
//                     ),
//                   ),

//                   pinned: true,

//                 ),
                  
//                   ],
                  
//                 ),
                
//              ),
             
//         ); 