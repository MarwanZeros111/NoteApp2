import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/logic/AddNote/add_note_cubit.dart';
import 'package:my_note_app/sqld.dart';
import 'package:my_note_app/view/screens/noteScreen.dart';
import 'package:my_note_app/view/widget/Custom_bottom.dart';
import 'package:my_note_app/view/widget/Text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            customtext(controller: title, hint: 'Title'),
            SizedBox(
              height: 30,
            ),
            customtext(
              controller: subtitle,
              hint: 'content',
              maxlen: 7,
            ),
            SizedBox(
              height: 80,
            ),
            custombottom(
                onTap: () async {
                  BlocProvider.of<NoteCubit>(context)
                      .sqldb
                      .insertData('''INSERT INTO notes ('title','note','color')
                VALUES ("${title.text}","${subtitle.text}",null) ''');
                  BlocProvider.of<NoteCubit>(context).readData();
                  Navigator.pop(context);
                },
                title: 'Add')
          ],
        ),
      ),
    );
  }
}
