import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/logic/AddNote/add_note_cubit.dart';
import 'package:my_note_app/view/screens/noteScreen.dart';
import 'package:my_note_app/view/widget/Add_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
          routes: {addNote.id: (context) => addNote()},
          initialRoute: noteView.id,
          title: 'Flutter Demo',
          theme: ThemeData(brightness: Brightness.dark),
          home: noteView()),
    );
  }
}
