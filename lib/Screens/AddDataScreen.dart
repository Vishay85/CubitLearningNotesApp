import 'dart:math';

import 'package:blocklearning/Cubit/notesCubit.dart';
import 'package:blocklearning/Models/NotesModel.dart';
import 'package:blocklearning/Widgets/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class AddDataScreen extends StatelessWidget {

  TextEditingController titleEditController = TextEditingController();
  TextEditingController descEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data Screen"),
      ),
      body: Column(
        children: [
          UiHelper.CustomTextField(titleEditController, "Enter Title", Icons.title),
          UiHelper.CustomTextField(descEditController, "Enter Desc", Icons.title),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            addData(titleEditController.text.toString(), descEditController.text.toString(), context);
          }, child: Text("Save"))
        ],
      ),
    );
  }

  addData(String title, String desc, BuildContext context){
    if(title =="" || desc == ""){
      return print("Enter Required Fields");
    }else{
      context.read<NotesCubit>().addNotes(NotesModel(title: title, desc: desc));
      print("Added Data");
    }
  }
}
