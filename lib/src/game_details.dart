

// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, non_constant_identifier_names, must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, avoid_print, unused_field


import 'package:collectify/src/add_game.dart';
import 'package:collectify/src/databaseclass_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'databaseclass.dart';

// --------------- imports for image downlaoding ------- // 

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import 'package:path/path.dart' as path;

// --------------------------------------------- //

import 'package:shared_preferences/shared_preferences.dart';




class game_details extends StatefulWidget {
   game_details({super.key, required this.general_id, required this.video_is_present, required this.game_name, required this.release_year, required this.summary, required this.platforms, required this.ratings, required this.game_verdict, required this.screenshots, required this.genres, required this.mad_king , required this.game_id , required this.game_status , required this.cover_link});
  late  int     game_id ;
  late  int     video_is_present ; 
  late  String  general_id ;
  late  String  game_name ; 
  late  String  release_year ;
  late  String  summary ;
  late  String  platforms;
  late  double  ratings ;
  late  String  game_verdict ; 
  late  dynamic screenshots ;
  late  String  genres ; 
  late  dynamic mad_king ;
  late  String  game_status ; 
  late  String  cover_link  ; 
  

  @override
  State<game_details> createState() => _game_detailsState();
}

class _game_detailsState extends State<game_details> {

  // played 
  Widget gamepad  = Icon(Icons.gamepad); 
  Widget _played  = Text('Add to Played');

  // wishlist
  Widget bookmark  = Icon(Icons.collections_bookmark_sharp); 
  Widget _whislist = Text('Add to Wishlist');

  // removed played 
  Widget remove_circle  = Icon(Icons.remove_circle_outline_sharp);
  Widget removed_played = Text('Remove From Played');

   // removed whishlist 
  Widget removed_wishlist = Text('Remove From Wishlist');

  // colors 
  Color original_color = Color(0xffF2CC8F);
  Color original_color_whishlist = Color(0xffF2CC8F);

  Color removed_color  = Color(0xffF4F1DE);



  @override
  Widget build(BuildContext context)  {

           debugPrint('game_status here waseem = ' + widget.game_status);

           String hihicover = '';

           // video is not present 
           if ( int.parse( widget.video_is_present.toString()) == 1 )
           {

              // cover 
              String fetched_cover =  widget.general_id.toString() ;
              String retraced = fetched_cover.replaceFirst(RegExp('t_thumb'), 't_1080p');
              hihicover = ('https:$retraced'); 

           }
           else if ( int.parse( widget.video_is_present.toString()) == 0 ) // video is present ( get cover different way )
           {

              // cover 
              String fetched_cover =  widget.cover_link.toString();
              String retraced = fetched_cover.replaceFirst(RegExp('t_thumb'), 't_1080p');
              hihicover = ('https:$retraced'); 


           }
           

            // screen shots list making 
            var pure_ss = [];
            var how_many_ss = widget.screenshots.length ;

            if (widget.screenshots.length == 0)
            { 

                  pure_ss.add('https://i.ibb.co/9WP4Hqy/404.jpg');
                  how_many_ss = 1 ;

                               
            }
            else
            {

              for (var i = 0 ; i <  int.parse(widget.screenshots.length.toString()) ; i++) {

                   pure_ss.add('https://images.igdb.com/igdb/image/upload/t_1080p/'+ widget.screenshots[i].toString() + '.jpg') ;
                   
                }


            }

           
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
                        hideControls: false,
                        loop: true,
                        enableCaption: false,
                        forceHD: true,
                        
                    ),
                  );

                  return Scaffold(

                  backgroundColor: Colors.white,

                  body: NestedScrollView(
            
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[

                  SliverAppBar(

                      elevation: 8,
                      forceElevated: true,                  
                      floating: false,
                      pinned: false,
                      snap: false,

                      backgroundColor: Color(0xff242424),
                  
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(

                        background: YoutubePlayer(

                              controller: _controller,
                              controlsTimeOut: Duration(seconds: 0),
                              showVideoProgressIndicator: false,

                      ),
                      ),
                    ),
             
            ];
          },
          body: ListView (

            padding: EdgeInsets.all(1),

            physics: BouncingScrollPhysics(),
           
            children: [

               // title of the game
               Padding(
                 padding: const EdgeInsets.only(left: 10 , right: 10 , top: 0),
                 child: ListTile(
                  title: Text(widget.game_name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xffe07a5f), fontFamily: 'Mulish-Bold', fontSize: 20)),
                  subtitle: Text( '(' + widget.release_year + ')',
                  style: TextStyle(color: Color(0xff81b29a), fontFamily: 'Mulish-Bold', fontSize: 16),                  
                  ),
                  ),
               ),


               // ----------- buttons List Tile  -------------------- // 

               (widget.game_status == "Null" ) ? ListTile(

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(original_color),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : gamepad,
                          label : _played,

                          onPressed: ()  async {


                          // download cover 
                          try  {

                                // downloading cover 
                                var imageId = await ImageDownloader.downloadImage(hihicover,
                                     destination: AndroidDestinationType.custom( directory: 'Game_Covers')
                                     ..inExternalFilesDir()
                                     ..subDirectory("1080p/${widget.game_id.toString()}.jpg"),
                                );


                                if (imageId == null) {
                                  return;
                                }


                              } on PlatformException catch (error) {
                                print(error);
                              }

                           // workaround 
                           String screenshots_joined  = "" ; 

                           for (var i = 0 ; i < widget.screenshots.length ; i++) {

                              screenshots_joined += widget.screenshots[i] + ',' ; 
                            
                           }


                          // remember the id of the game with shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Played"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // Put the data in the database. 
                          DatabaseHelper.instance.addnote(gaime(general_id: widget.general_id , video_is_present: widget.video_is_present, game_name: widget.game_name, release_year: widget.release_year, summary: widget.summary, platforms: widget.platforms, ratings: widget.ratings, game_verdict: widget.game_verdict, screenshots: screenshots_joined, genres: widget.genres, mad_king: widget.genres, game_id: widget.game_id , cover_link: widget.cover_link , game_status: handout));
                          

                          setState(() {

                          widget.game_status = handout ; 
                         
                        });
             
                      }, 

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(original_color_whishlist),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : bookmark,
                          label : _whislist,

                         onPressed: () async {


                          // download cover  
                           try  {

                                // downloading cover 
                                var imageId = await ImageDownloader.downloadImage(hihicover,
                                     destination: AndroidDestinationType.custom( directory: 'Game_Covers')
                                     ..inExternalFilesDir()
                                     ..subDirectory("1080p/${widget.game_id.toString()}.jpg"),
                                );


                                if (imageId == null) {
                                  return;
                                }


                              } on PlatformException catch (error) {
                                print(error);
                              }

                           // workaround 
                           String screenshots_joined  = "" ; 

                           for (var i = 0 ; i < widget.screenshots.length ; i++) {

                              screenshots_joined += widget.screenshots[i] + ',' ; 
                            
                           }

                          // remember the id of the game with shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Wishlist"); 

                          // get the status of the game to pass to game_status 
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // Put the data in the wishlist database. 
                          DatabaseHelper_wishlist.instance.addnote_wishlist(gaime_whislist(general_id: widget.general_id , video_is_present: widget.video_is_present, game_name: widget.game_name, release_year: widget.release_year, summary: widget.summary, platforms: widget.platforms, ratings: widget.ratings, game_verdict: widget.game_verdict, screenshots: screenshots_joined, genres: widget.genres, mad_king: widget.genres, game_id: widget.game_id, cover_link: widget.cover_link , game_status: handout));

                          setState(() {

                              widget.game_status = handout ;

                          });
                        },  
                       ),
                      ),
                    ],
                   )
                  ),
                ) : ( widget.game_status == 'Played') ? ListTile (

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(removed_color),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : remove_circle,
                          label : removed_played,

                          onPressed: ()  async {
                            
                          // Delete the id of the game From shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Null"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // delete from the database 
                          DatabaseHelper.instance.deletenote(int.parse(widget.game_id.toString()));

                          // delete cover to save space . 
                          deleteFile(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${widget.game_id}.jpg'));
               
                          setState(() {

                          widget.game_status = handout ; 
                         
                        });
             
                      }, 

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(Colors.grey),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : bookmark,
                          label : _whislist,

                         onPressed: null,

                       
                       ),
                      ),
                    ],
                   )
                  ),
                ) : ListTile (

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : gamepad,
                          label : _played,

                          onPressed: null,
                         
                      

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(removed_color),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : remove_circle,
                          label : removed_wishlist,

                         onPressed : () async {

                           // Delete the id of the game From shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Null"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // delete from the database 
                          DatabaseHelper_wishlist.instance.deletenote_wishlist(int.parse(widget.game_id.toString()));

                          // delete cover to save space . 
                          deleteFile_wishlist(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${widget.game_id}.jpg'));
               
                          setState(() {

                          widget.game_status = handout ; 
                         
                        });

                         },

                       
                       ),
                      ),
                    ],
                   )
                  ),
                ),

          
                // summary
                ListTile(
          
                title: Container(
          
                  decoration: BoxDecoration(
                                    
                  color: Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ), 
                  
                  padding: EdgeInsets.all(10),     
                  child: Text('Game Description' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),
                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
          
                  ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.summary.toString() , maxLines: 6, overflow: TextOverflow.ellipsis,
                    
                    style: TextStyle(color: Colors.grey.shade500, fontFamily: 'OpenSans-medium', fontSize: 17),
                    
                    ),
                  ),
                ),
          
                // platforms
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
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
                    child: Text(widget.platforms, 
                    
                     style: TextStyle(color: Colors.grey, fontFamily: 'OpenSans-medium', fontSize: 16),
                    
                    ),
                    
                  ),
                ),

                 // Genres
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
           
                  padding: EdgeInsets.all(10),     
                  child: Text('Genres', style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),
          
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  
                  )
                  ),

                  subtitle:  BulletedList(
                  listItems: widget.mad_king,
                  bullet: Icon(Icons.subdirectory_arrow_right_rounded , size: 30, color:Color(0xff81b29a),),
                  style: TextStyle(color: Colors.grey , fontFamily: 'Mulish-Bold', fontSize: 16),
                  ),
                  ),

                // screenshots
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
          
                  padding: EdgeInsets.all(10),     
                  child: Text('ScreenShots' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                    subtitle: SizedBox(
                    height: 210,
                    child: ListView.builder(
                      
                          physics: BouncingScrollPhysics(),
                          itemCount: how_many_ss,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
               
                           return Card(
                            elevation: 10,
                            color: Colors.white,
                             margin: EdgeInsets.all(10),
              
                             child: Padding(
                               padding: const EdgeInsets.all(4.0),

                                  child: Image.network(pure_ss[index]),
                                     
                               // child: Image.network('https://images.igdb.com/igdb/image/upload/t_1080p/'+ widget.screenshots[index] + '.jpg')
                                     
                             ),
                           );
                          },                        
                        ),
                  ),
                ),
          
                // rating 
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
          
                  
                  padding: EdgeInsets.all(10),     
                  child: Text('IGDB Rating' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        children: [
          
                          RatingBar.builder(
          
                            unratedColor: Color(0xff3d405b),
                            tapOnlyMode: true,
                            glow: false,
                            ignoreGestures: true,
                            initialRating: widget.ratings,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0 , vertical: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xff81b29a),
                            ),
                            onRatingUpdate: (rating) {
                             
                            },
                          ),
          
                          ListTile(title: Container(
          
                             decoration: BoxDecoration(
                                                  
                              color:  Color(0xfff2cc8f),
                              borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                              ),
                            
                              // Verdict 
                              margin: EdgeInsets.only(bottom: 20),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.game_verdict.toString(), textAlign: TextAlign.center,
          
                              style: TextStyle(color: Color(0xff3d405b), fontFamily: 'OpenSans-medium', fontSize: 16),
                              
                              
                              ),
                              
                            )
                            
                            ), 
                            )
                                  ],
                                ),
                              ),
                            ) ,
                    
                          ),
                      ],
                    ) ,
                  ),
              );
            }
            
            // the cover outcome.

             return Scaffold(

             backgroundColor: Colors.white,

             body: NestedScrollView(
            
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
          body: ListView (

            padding: EdgeInsets.all(0),

            physics: BouncingScrollPhysics(),
           
            children: [
               // title of the game
               Padding(
                 padding: const EdgeInsets.only(left: 5 , right: 10 , top: 0 ,),
                 child: ListTile(
                  title: Text(widget.game_name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xffe07a5f), fontFamily: 'Mulish-Bold', fontSize: 20)),
                  subtitle: Text( '(' + widget.release_year + ')',
                  style: TextStyle(color: Color(0xff81b29a), fontFamily: 'Mulish-Bold', fontSize: 16),
                  ),
                  ),
               ),


                // ----------- buttons List Tile  -------------------- // 

               (widget.game_status == 'Null' ) ? ListTile(

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(original_color),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : gamepad,
                          label : _played,

                          onPressed: ()  async {


                          // download cover 
                          try  {

                                // downloading cover 
                                var imageId = await ImageDownloader.downloadImage(hihicover,
                                     destination: AndroidDestinationType.custom( directory: 'Game_Covers')
                                     ..inExternalFilesDir()
                                     ..subDirectory("1080p/${widget.game_id.toString()}.jpg"),
                                );


                                if (imageId == null) {
                                  return;
                                }


                              } on PlatformException catch (error) {
                                print(error);
                              }

                           // workaround 
                           String screenshots_joined  = "" ; 

                           for (var i = 0 ; i < widget.screenshots.length ; i++) {

                              screenshots_joined += widget.screenshots[i] + ',' ; 
                            
                           }


                          // remember the id of the game with shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Played"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // Put the data in the database. 
                          DatabaseHelper.instance.addnote(gaime(general_id: widget.general_id , video_is_present: widget.video_is_present, game_name: widget.game_name, release_year: widget.release_year, summary: widget.summary, platforms: widget.platforms, ratings: widget.ratings, game_verdict: widget.game_verdict, screenshots: screenshots_joined, genres: widget.genres, mad_king: widget.genres, game_id: widget.game_id , cover_link: widget.cover_link , game_status: handout));
                          

                          setState(() {

                          widget.game_status = handout ; 
                         
                        });
             
                      }, 

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(original_color_whishlist),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : bookmark,
                          label : _whislist,

                         onPressed: () async {


                          // download cover  
                           try  {

                                // downloading cover 
                                var imageId = await ImageDownloader.downloadImage(hihicover,
                                     destination: AndroidDestinationType.custom( directory: 'Game_Covers')
                                     ..inExternalFilesDir()
                                     ..subDirectory("1080p/${widget.game_id.toString()}.jpg"),
                                );


                                if (imageId == null) {
                                  return;
                                }


                              } on PlatformException catch (error) {
                                print(error);
                              }

                           // workaround 
                           String screenshots_joined  = "" ; 

                           for (var i = 0 ; i < widget.screenshots.length ; i++) {

                              screenshots_joined += widget.screenshots[i] + ',' ; 
                            
                           }

                          // remember the id of the game with shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Wishlist"); 

                          // get the status of the game to pass to game_status 
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // Put the data in the wishlist database. 
                          DatabaseHelper_wishlist.instance.addnote_wishlist(gaime_whislist(general_id: widget.general_id , video_is_present: widget.video_is_present, game_name: widget.game_name, release_year: widget.release_year, summary: widget.summary, platforms: widget.platforms, ratings: widget.ratings, game_verdict: widget.game_verdict, screenshots: screenshots_joined, genres: widget.genres, mad_king: widget.genres, game_id: widget.game_id, cover_link: widget.cover_link , game_status: handout));

                          setState(() {

                              widget.game_status = handout ;

                          });
                        },  
                       ),
                      ),
                    ],
                   )
                  ),
                ) : ( widget.game_status == 'Played') ? ListTile (

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(removed_color),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : remove_circle,
                          label : removed_played,

                          onPressed: ()  async {
                            
                          // Delete the id of the game From shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Null"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // delete from the database 
                          DatabaseHelper.instance.deletenote(int.parse(widget.game_id.toString()));

                          // delete cover to save space . 
                          deleteFile(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${widget.game_id}.jpg'));
               
                          setState(() {

                          widget.game_status = handout ; 
                         
                        });
             
                      }, 

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(Colors.grey),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : bookmark,
                          label : _whislist,

                         onPressed: null,

                       
                       ),
                      ),
                    ],
                   )
                  ),
                ) : ListTile (

                  title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      
                      children: [
                      
                      ElevatedButton.icon(
                          
                          style          : ButtonStyle(
                          elevation      : MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey),
                          foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                                                  
                          ),
                  
                          icon  : gamepad,
                          label : _played,

                          onPressed: null,
                         
                      

                      ),


                      // wishlist button 

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton.icon(

                           style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(removed_color),
                            foregroundColor: MaterialStatePropertyAll(Color(0xff3d405b)), 
                            
                            ),
                      
                          icon  : remove_circle,
                          label : removed_wishlist,

                         onPressed : () async {

                           // Delete the id of the game From shared preferences. 
                          SharedPreferences pre = await SharedPreferences.getInstance();
                          pre.setString(widget.game_id.toString(), "Null"); 

                          // get the status of the game to pass to game_status
                          String handout = pre.getString(widget.game_id.toString()) ?? "Null";

                          // delete from the database 
                          DatabaseHelper_wishlist.instance.deletenote_wishlist(int.parse(widget.game_id.toString()));

                          // delete cover to save space . 
                          deleteFile_wishlist(File('/storage/emulated/0/Android/data/com.example.GameRaid/files/Game_Covers/1080p/${widget.game_id}.jpg'));
               
                          setState(() {

                          widget.game_status = handout ; 
                         
                        });

                         },

                       
                       ),
                      ),
                    ],
                   )
                  ),
                ),

                // summary
                ListTile(
          
                title: Container(
          
                  decoration: BoxDecoration(
                                    
                  color: Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),                  
                  
                  padding: EdgeInsets.all(10),     
                  child: Text('Game Description' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),
                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
          
                  ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.summary.toString() , maxLines: 6, overflow: TextOverflow.ellipsis,
                    
                    style: TextStyle(color: Colors.grey.shade500, fontFamily: 'OpenSans-medium', fontSize: 17),
                    
                    ),
                  ),
                ),
          
                // platforms
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
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
                    child: Text(widget.platforms, 
                    
                     style: TextStyle(color: Colors.grey, fontFamily: 'OpenSans-medium', fontSize: 16),
                    
                    ),
                    
                  ),
                ),

                 // Genres
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
           
                  padding: EdgeInsets.all(10),     
                  child: Text('Genres', style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'),
          
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  
                  )
                  ),

                  subtitle:  BulletedList(
                  listItems: widget.mad_king,
                  bullet: Icon(Icons.subdirectory_arrow_right_rounded , size: 30, color:Color(0xff81b29a),),
                  style: TextStyle(color: Colors.grey , fontFamily: 'Mulish-Bold', fontSize: 16),
                  ),
                  ),

                // screenshots
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
          
                  padding: EdgeInsets.all(10),     
                  child: Text('ScreenShots' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                    subtitle: SizedBox(
                    height: 210,
                    child: ListView.builder(

                          physics: BouncingScrollPhysics(),
                          itemCount: how_many_ss,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
               
                           return Card(
                            elevation: 10,
                            color: Colors.white,
                             margin: EdgeInsets.all(10),
              
                             child: Padding(
                               padding: const EdgeInsets.all(4.0),

                                  child: Image.network(pure_ss[index]),
                                     
                               // child: Image.network('https://images.igdb.com/igdb/image/upload/t_1080p/'+ widget.screenshots[index] + '.jpg')
                                     
                             ),
                           );
                          },                        
                        ),
                  ),
                ),
          
                // rating 
                ListTile(
                title: Container(
          
                  decoration: BoxDecoration(
                                                  
                  color:  Color(0xff3d405b),
                  borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                  ),
          
                  
                  padding: EdgeInsets.all(10),     
                  child: Text('IGDB Rating' , style: TextStyle(color: Colors.white , fontFamily: 'Mulish-Bold'))
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        children: [
          
                          RatingBar.builder(
          
                            unratedColor: Color(0xff3d405b),
                            tapOnlyMode: true,
                            glow: false,
                            ignoreGestures: true,
                            initialRating: widget.ratings,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0 , vertical: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xff81b29a),
                            ),
                            onRatingUpdate: (rating) {
                             
                            },
                          ),
          
                          ListTile(title: Container(
          
                             decoration: BoxDecoration(
                                                  
                              color:  Color(0xfff2cc8f),
                              borderRadius:  BorderRadius.all(Radius.elliptical(10,10)),
                              ),
                            
                              // Verdict 
                              margin: EdgeInsets.only(bottom: 20),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.game_verdict.toString(), textAlign: TextAlign.center,
          
                              style: TextStyle(color: Color(0xff3d405b), fontFamily: 'OpenSans-medium', fontSize: 16),
                              
                              
                              ),
                              
                            )
                            
                            ), 
                            )
                        ],
                      ),
                    ),
                  ) ,
          
                ),
            ],
          ) ,
        ),
    );
    }    
  }