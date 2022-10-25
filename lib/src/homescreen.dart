// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:collectify/src/add_game.dart';
import 'package:collectify/src/discover.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'catagories.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {


    // -------------- buttom navigation bar logic ------------ // 

    int _currentIndex = 0;
    late PageController _pageController;

    @override
    void initState() {
      super.initState();
      _pageController = PageController();
    }

    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    //--------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Collectify',
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
        titleTextStyle: TextStyle(color:  Color(0xffe07a5f), fontSize: 22 , fontFamily: 'Mulish-Bold',), 

        foregroundColor:  Color(0xffe07a5f),
        backgroundColor:  Color(0xffffffff),
        title:  const Text('GameRaid') ,
      ),

      backgroundColor: Colors.white,

      drawer: Drawer(
      
      backgroundColor: Color(0xffffffff),
        
      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [

       DrawerHeader(
        decoration: BoxDecoration(
         image: DecorationImage(
                  image: AssetImage('images/cover.png'),
                  
                     fit: BoxFit.cover)
              ),
          child: null,
        ),
      

        // 1 
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(

          // colors 
          tileColor: Color(0xff3d405b),
          iconColor: Color(0xffffffff),
          textColor: Color(0xffffffff),

          // icon 
          leading: const Icon(Icons.settings, size: 30,),

          // text
          title: const Text('Settings', style: TextStyle(color: Colors.white , fontSize: 18 , fontFamily: 'Mulish-Bold' , decoration: TextDecoration.none,)),

          // back_end handle
          onTap: () {
           
          },
          ),
        ),

        // 2 
        ListTile(

        // colors 
        tileColor: Color(0xff3d405b),
        iconColor: Color(0xffffffff),
        textColor: Color(0xffffffff),

        // icon 
        leading: const Icon(Icons.info_outline_rounded, size: 30,),

        // text
        title: const Text('About', style: TextStyle(color: Colors.white , fontSize: 18 , fontFamily: 'Mulish-Bold' , decoration: TextDecoration.none,)),

        // back_end handle
        onTap: () {
         
        },

        ),

         ],
        ),   
        
        ),


        floatingActionButton: FloatingActionButton(
          
        elevation: 10,
        backgroundColor: Color(0xffe07a5f),
        foregroundColor: Colors.white,
        child: const Icon(Icons.search , size: 30,),
        onPressed: () {

          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const add_game()),
          );

        },
        
        ),

        

        bottomNavigationBar:  BottomNavyBar(
        
        // personel touch   
        iconSize: 30,
        itemCornerRadius: 10,
        showElevation: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[

          BottomNavyBarItem( 
            inactiveColor:  Color(0xff3d405b),
            activeColor:    Color(0xffe07a5f),
            title: Text('Collection'),
            icon: Icon(Icons.collections_bookmark_sharp)
          ),
          BottomNavyBarItem(
            inactiveColor:  Color(0xff3d405b),
            activeColor:    Color(0xffe07a5f),
            title: Text('Hot & New'),
            icon: Icon(Icons.gamepad_sharp)
          ),
          BottomNavyBarItem(
            inactiveColor:  Color(0xff3d405b),
            activeColor:    Color(0xffe07a5f),
            title: Text('Catagories'),
            icon: Icon(Icons.pie_chart_sharp)
          ),
        ],
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        extendBody: true,

          body: Container(           
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/background/pattern_2/image.jpg"),
            fit: BoxFit.cover,
            ),
            ),
           

           child: SizedBox.expand(
           child: PageView(
           controller: _pageController,
           onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
         
          children: <Widget>[
            
            // page  1
            Container(color:  Colors.transparent,), 

            // page 2 
            discover(),

            // page 3 
            catagories(),   
               //  index 4
            ],
          ),
          ),

          ),

      ),
    );
  }
}