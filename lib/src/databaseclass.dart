

// ignore_for_file: non_constant_identifier_names, camel_case_types

/* ----------------  imports for sqflite    -------------------- */

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


/* ----------------  Object Model  ---------------------- */

class gaime {

      final  dynamic  general_id ;
      final  int      video_is_present ; 
      final  dynamic  game_name ; 
      final  String   release_year ;
      final  String   summary ;
      final  String   platforms;
      final  double   ratings ;
      final  String   game_verdict ; 
      final  dynamic  screenshots ;
      final  String   genres ; 
      final  dynamic  mad_king ;
      final  dynamic  game_id ;
      final  String   cover_link ;
      final  String   game_status ;    

  

  const gaime({

      required this.general_id,
      required this.video_is_present, 
      required this.game_name, 
      required this.release_year,
      required this.summary,
      required this.platforms,
      required this.ratings,
      required this.game_verdict,
      required this.screenshots,
      required this.genres,
      required this.mad_king,
      required this.game_id, 
      required this.cover_link,
      required this.game_status,


  });

  factory gaime.fromMap(Map<String, dynamic> json) => gaime(

 
      general_id       :  json['general_id'],
      video_is_present :  json['video_is_present'],
      game_name        :  json['game_name'],
      release_year     :  json['release_year'],
      summary          :  json['summary'],
      platforms        :  json['platforms'],
      ratings          :  json['ratings'],
      game_verdict     :  json['game_verdict'],
      screenshots      :  json['screenshots'],
      genres           :  json['genres'],
      mad_king         :  json['mad_king'],
      game_id          :  json['game_id'],
      cover_link       :  json['cover_link'],
      game_status      :  json['game_status'],


  );

 
  Map<String, dynamic> toMap() {
    return { 

      'general_id'       :  general_id,
      'video_is_present' :  video_is_present,
      'game_name'        :  game_name,
      'release_year'     :  release_year,
      'summary'          :  summary,
      'platforms'        :  platforms,
      'ratings'          :  ratings,
      'game_verdict'     :  game_verdict,
      'screenshots'      :  screenshots,
      'genres'           :  genres,
      'mad_king'         :  mad_king, 
      'game_id'          :  game_id,
      'cover_link'       :  cover_link,
      'game_status'      :  game_status,



    };
  }

}

/* -------------- DatabaseHelper ------------------ */


class DatabaseHelper {

  // use _privateConstructor method on our class 
  DatabaseHelper._privateConstructor();

  // making an instance 
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // checking if the dataabse already exists 
  static Database? _database4 ; 
  Future<Database> get database async =>  _database4 ??= await _initDatabase();


  // if dataabse dont exists then create a new one 
  Future<Database> _initDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path , 'notes.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
  }

  // create a table with the following fields 
  Future _onCreate(Database db, int version ) async {
    await db.execute('''
    CREATE TABLE notes (
      game_id INTEGER UNIQUE PRIMARY KEY NOT NULL,
      general_id TEXT, 
      video_is_present INTEGER,
      game_name TEXT, 
      release_year TEXT, 
      summary TEXT,
      platforms TEXT,
      ratings DOUBLE,
      game_verdict TEXT,
      screenshots TEXT,
      genres TEXT, 
      mad_king TEXT,
      cover_link TEXT,
      game_status TEXT           

      )'''
    );
  }



   // function to add notes to the database 
   Future<int> addnote(gaime notey) async {
   Database db = await instance.database;
   return await db.insert('notes', notey.toMap());
  }

   // fetch notes 
   Future<List<Map>> fetchnote() async {
   Database db = await instance.database;
   return await db.rawQuery('SELECT * FROM notes;');
  }

   // delete notes 
   Future<List<Map>> deletenote(int game_id) async {
   Database db = await instance.database;
   return await db.rawQuery('Delete FROM notes WHERE game_id = ? ;' , [game_id]);
  }

   
   // update notes 
   Future<int> updatenotes(gaime notey) async {
   Database db = await instance.database;
   return await db.update('notes', notey.toMap() , where: 'game_id = ?' , whereArgs: [notey.game_id]);
  }

  
   // clear
   Future<List<Map>> deleteall() async {
   Database db = await instance.database;
   return await db.rawQuery('DELETE FROM notes;');
  }
   

}


 // delete local files 
Future<void> deleteFile(File file) async {
  try {
    if (await file.exists()) {
      await file.delete();
    }
  } catch (e) {
    // Error in getting access to the file.
  }
}