
// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_types_as_parameter_names

/* ----------------  imports for main    ---------------------- */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/splashScreen.dart';

/* -------------------- main ---------------------- */

void main() {

    // for using async if needed in main 
    WidgetsFlutterBinding.ensureInitialized();

    // for status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    )); 
 
    // check every second for screen overlays change 
    SystemChrome.setSystemUIChangeCallback((SystemUiOverlay) async {
    await Future.delayed(const Duration(seconds: 1));
    SystemChrome.restoreSystemUIOverlays();
    });
 

runApp(MaterialApp(

     theme: ThemeData(
            primarySwatch: buildMaterialColor(Color(0xffe07a5f)),
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: AppBarTheme(
            foregroundColor: buildMaterialColor(const Color.fromARGB(255, 255, 255, 255)),
            ),

            snackBarTheme: SnackBarThemeData( contentTextStyle: TextStyle(color: Color(0xff3943B7), fontFamily: 'Russo One' , fontSize: 18 ),
            backgroundColor: buildMaterialColor(Colors.white),
            actionTextColor: buildMaterialColor(const Color.fromARGB(255, 40, 178, 202)),
            
            ),
            
            ),

            // to remove debug banner 
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
      ));
  
} 

/* ----------- material color function ------------------ */

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}


/* ---------------------------------------------------- */



