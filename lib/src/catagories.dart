






// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:collectify/src/genres_and_themes.dart';
import 'package:flutter/material.dart';


class catagories extends StatefulWidget {
  const catagories({super.key});

  @override
  State<catagories> createState() => _catagoriesState();
}

class _catagoriesState extends State<catagories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
    
      body: GridView.count(
        
        crossAxisCount   : 1,
        childAspectRatio: 6/2,
        crossAxisSpacing : 0,
        mainAxisSpacing  : 8,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 120 , left: 10, right: 10, top: 10, ),
       
        children: [


          // Action
          GestureDetector(

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                  picked_genre: 'Action',
                  
                  )
                  )
                );    

            },

            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,
                  
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/action.jpg'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 277),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.blue.shade800,
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                        child    :  const Text('Action',
                        overflow :  TextOverflow.ellipsis,
                        maxLines :  1,
                        style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),

         // Fighting
         GestureDetector(

          onTap: () {
    
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                  picked_genre: 'Fighting',
                  
                  )
                  )
                ); 

          },

           child: Card(
         
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
         
             ),
         
             color:  Color(0xff3d405b),
             elevation: 8,
         
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,
                  
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
         
                    'images/placeholder/Fighting.jpg'
                    
                    ),
                  ),
                ),
                 
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 260),                                        
                        textColor      : Colors.grey.shade800,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     : const BoxDecoration(
                        color          : Colors.amber,
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                        child    :  const Text('Fighting',
                        overflow :  TextOverflow.ellipsis,
                        maxLines :  1,
                        style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
         ),

          // shooter 
          GestureDetector(

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                 picked_genre: 'Shooter',
                  
                  )
                  )
                ); 

            },

            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,
                  
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/Shooter.jpg'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 263),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.green.shade800,
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                        child    :  const Text('Shooter',
                        overflow :  TextOverflow.ellipsis,
                        maxLines :  1,
                        style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),

          // Racing
          GestureDetector(

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                  picked_genre: 'Racing',
                  
                  )
                  )
                ); 


            },


            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,         
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/Racing.jpg'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 272),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.indigo, 
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                          child    :  const Text('Racing',
                          overflow :  TextOverflow.ellipsis,
                          maxLines :  1,
                          style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),







          // open world
          GestureDetector(

            onTap: () {
    
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                   picked_genre: 'Open_World',
                  
                  )
                  )
                ); 

            },


            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,         
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/open_world.jpg'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 222),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.orange.shade800,
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                        child    :  const Text('Open World',
                        overflow :  TextOverflow.ellipsis,
                        maxLines :  1,
                        style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),


          // Third Person
          GestureDetector(

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                  picked_genre: 'Third_Person',
                  
                  )
                  )
                ); 

            },



            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,         
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/Third_Person.png'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 217),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.cyan.shade800,
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                        child    :  const Text('Third Person',
                        overflow :  TextOverflow.ellipsis,
                        maxLines :  1,
                        style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),


          // Simulator
          GestureDetector(

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => genres_and_themes(
                
                  picked_genre: 'Simulator',
                  
                  )
                  )
                ); 


            },


            child: Card(
          
             margin       : const EdgeInsets.all(10),
             shape        : const RoundedRectangleBorder(
             borderRadius : BorderRadius.all(Radius.elliptical(10,10)),
          
             ),
          
            color:  Color(0xff3d405b),
            // color: const Color.fromARGB(255, 48, 101, 214),
            elevation: 8,
          
             child: Container(
                   
                  decoration      : BoxDecoration(
                
                  borderRadius    : const BorderRadius.all(Radius.elliptical(10,10)),
                  image           : const DecorationImage(
                  opacity         : 0.5,         
                  fit             : BoxFit.fitWidth,                       
                  filterQuality   : FilterQuality.none,
                  isAntiAlias     : true,
                  
                  image           : AssetImage(
          
                    'images/placeholder/Simulator.jpg'
                    
                    ),
                  ),
                ),
                  
                child: Align(
                  alignment: FractionalOffset.center,
                              
                        child          : ListTile(      
                        contentPadding : const EdgeInsets.only(bottom: 10, left: 10, right: 244),                                        
                        textColor      : Colors.white,                       
                        subtitle       : Container(
                        padding        : const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),                    
                        decoration     :  BoxDecoration(
                        color          :  Colors.brown.shade900, 
                        borderRadius   : BorderRadius.all(Radius.elliptical(10,10)),
                        ),
                
                          child    :  const Text('Simulator',
                          overflow :  TextOverflow.ellipsis,
                          maxLines :  1,
                          style    :  TextStyle( fontFamily: 'Mulish-Bold', fontSize: 20,) , textAlign: TextAlign.left,),
                              
                          ),
                        ),
                      ),
                
                  ),
              
              ),
          ),
        ],        
        ),
      
    );
  }
}