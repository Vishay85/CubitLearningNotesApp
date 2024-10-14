import 'package:blocklearning/Models/NotesModel.dart';

abstract class NotesState{}

class NotesInitialState extends NotesState{}

class NotesLoadingState extends NotesState{}

class NotesLoadedState extends NotesState{

  List<NotesModel>?arrNotes = [];
  int? id;
  NotesLoadedState({this.arrNotes, this.id});
}

class NotesErrorState extends NotesState{
  // all error handle with error state

  String error;
  NotesErrorState({required this.error});
}