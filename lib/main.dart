import 'package:blocklearning/Cubit/notesCubit.dart';
import 'package:blocklearning/Models/DbHelper.dart';
import 'package:blocklearning/Screens/notesapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NotesCubit(dbHelper: DbHelper()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NotesAppScreen(),
      ),
    );
  }
}



