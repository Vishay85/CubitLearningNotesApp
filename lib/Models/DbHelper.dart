import 'dart:io';

import 'package:blocklearning/Models/NotesModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  static final DbHelper db=DbHelper(); //single class
  Database? _database; // jiske bhi age _ aye private variable or function hoga
  static const Note_table = "notes_table";
  static const Note_columnid = "notes_id";
  static const Note_columntitle = "notes_title";
  static const Note_columndescription = "notes_desc";

  Future<Database>getDb() async{
    if(_database !=null){
      return _database!;
    }else{
      return await initDb();
    }
  }

  Future<Database>initDb()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join("${directory.path}notesdb.db");
    return openDatabase(dbpath,version: 1,onCreate: (db,version){
      db.execute(
          "create table $Note_table ($Note_columnid integer autoincrement, $Note_columntitle text, $Note_columndescription text)");

    });
  }

  //we use bool in angular bracket matlb agar database create hai to true millega else false
  Future<bool>addNotes(NotesModel newNote) async{
    var db=await getDb();
    int rowsEffect= await db.insert(Note_table, newNote.toMap());
    return rowsEffect>0; //0-False, 1-True
  }

  Future<List<NotesModel>>fetchNotes() async{
    var db = await getDb();

    // db.query me table ka sara data la rhe hai jese ki select * from table_name
    List<Map<String, dynamic>>notes = await db.query(Note_table);
    List<NotesModel>listNotes=[];
    for(Map<String, dynamic>notemodel in notes){
      NotesModel getNotes = NotesModel.fromMap(notemodel);
      listNotes.add(getNotes);
    }
    return listNotes;
  }


}