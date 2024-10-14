
import 'package:blocklearning/Cubit/notesState.dart';
import 'package:blocklearning/Models/DbHelper.dart';
import 'package:blocklearning/Models/NotesModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NotesState>{

  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}):super(NotesInitialState());

  addNotes(NotesModel notemodel) async{
    emit(NotesLoadingState());
    // await dbHelper.addNotes(notemodel);

    bool check = await dbHelper.addNotes(notemodel);
    if(check){
      var notes = await dbHelper.fetchNotes();
      emit(NotesLoadedState(arrNotes: notes));
    }else{
      emit(NotesErrorState(error: "No Data Added"));
    }
  }

  getNotes() async {
    emit(NotesLoadingState());
    var notes= await dbHelper.fetchNotes();
    emit(NotesLoadedState(arrNotes: notes));
  }

}