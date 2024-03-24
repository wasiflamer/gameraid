
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


double buttom_padding = 0 ;
double top_padding    = 0 ; 

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {

  
   double screen_width =  MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;

   if (screen_width <= 1080.0 )
   {
       buttom_padding = 80 ;
       top_padding = 100 ;  
   }
   else if ( screen_width > 1080.0 )
   {
       buttom_padding = 120 ;
       top_padding = 150;
   }
  
   
    return MaterialApp(

      // to remove debug banner 
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: (Color(0xff3d405b)),
          shape: const   RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
          bottomRight:   Radius.circular(0),
          bottomLeft:    Radius.circular(0),  
          ),
          ),

          title: Row(   
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Container(
            margin: const EdgeInsets.all(0),
            child  : ElevatedButton(
            onPressed: () {

              // go back to settings
              Navigator.pop(context);

            },
            style: ElevatedButton.styleFrom(
            foregroundColor: (Color(0xff3d405b)),
            backgroundColor: (Color(0xffe07a5f)),
            shape: const CircleBorder(),
            
            ),
            child: const Icon(Icons.arrow_back_sharp),
          ),

          ),

          Container(
          padding: const EdgeInsets.only(right: 60), child: const Text('About', style: TextStyle(fontSize: 25.0 , fontFamily: 'Russo One', ))) 
          ],   
          ), 
          ),

          body: Container(   

          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/background/pattern_2/image.jpg"),
          fit: BoxFit.none,
          ),
          ),

          child: Center(
          child: Card(
          color: (Color(0xff3d405b)),
          
          shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(10)),
          ),

          margin: EdgeInsets.only(bottom: buttom_padding , top: top_padding ),
  
          elevation: 10,
          child: Column(
            
            children: [
              SizedBox(
              width: 300,
              height: 150,

              child:  Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only( topLeft:Radius.circular(10) , topRight:Radius.circular(10)),
              image: DecorationImage(
              image: AssetImage("images/cover.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              ),
              ), 
              ),
              ),

              SizedBox(

              width: 300,
              height: 240,
              child:  Column(
                children: [
                  
                  Container(
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only( bottomLeft:Radius.circular(10) , bottomRight:Radius.circular(10)),
                  color: (Color(0xff3d405b)),
                  ),

                  child: Align(
                  
                  alignment: Alignment.topLeft ,
                  child: Padding(padding: EdgeInsets.all(10),
                  child: ListTile(
                  tileColor: (Color(0xff3d405b)),
                  title: Text('GameRaid', style: TextStyle(color: Colors.white , fontSize: 20 , fontFamily: 'Mulish-Bold'),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text('A Lover Letter to My Undying Passion For Video Games, Its Not Perfect - Nothings is ...                 Have Fun Using it as I have Fun Making It, Dedicated to Zoe and Icarus As Always.',
                    style: TextStyle(color: Colors.white70 , fontSize: 16 , fontFamily: 'sans'),),
                  ),
                  
                 
                  ),
                  ),
                  ),
                  ),

                ],
              ),
              ),
            ],
          ),
          ),
        ),
        ),

      extendBodyBehindAppBar: true,  
        
    ),
    );
      
  }
}

