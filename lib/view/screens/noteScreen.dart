import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/logic/AddNote/add_note_cubit.dart';
import 'package:my_note_app/sqld.dart';
import 'package:my_note_app/view/screens/Bottom_Sheet.dart';
import 'package:my_note_app/view/widget/note_screen_body.dart';

class noteView extends StatefulWidget {
  const noteView({super.key});
  static String id = "noteScreen";

  @override
  State<noteView> createState() => _noteViewState();
}

class _noteViewState extends State<noteView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).readData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return AddNoteBottomSheet();
              });
        },
        child: Icon(Icons.add),
      ),
      body: noteViewBody(),
    );
  }
}
