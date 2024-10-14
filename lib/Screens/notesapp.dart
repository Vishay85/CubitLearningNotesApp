
import 'package:blocklearning/Cubit/notesCubit.dart';
import 'package:blocklearning/Cubit/notesState.dart';
import 'package:blocklearning/Screens/AddDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesAppScreen extends StatelessWidget {
  const NotesAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit, NotesState>(builder: (context,state){
        if(state is NotesLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is NotesErrorState){
          return Center(child: Text(state.error.toString()),);
        }else if(state is NotesLoadedState){
          return ListView.builder(itemBuilder: (context, index){
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text(state.arrNotes![index].title),
              subtitle: Text(state.arrNotes![index].title),
            );
          }, itemCount: state.arrNotes!.length,);
        }
        return Center(child: Text("Add Notes"));
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> AddDataScreen()));
      }, child: const Icon(Icons.add),),
    );
  }
}
