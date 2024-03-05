import 'package:flutter/material.dart';
import 'package:my_note_app/view/widget/Color_view.dart';
import 'package:my_note_app/view/widget/Custom_bottom.dart';
import 'package:my_note_app/view/widget/Text_field.dart';

class addNote extends StatefulWidget {
  addNote({
    super.key,
  });
  static String id = "addNote";

  @override
  State<addNote> createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {
  @override
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
            child: Form(
                key: formkey,
                autovalidateMode: autovalidateMode,
                child: Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  customtext(
                    onsaved: (data) {
                      title = data;
                    },
                    hint: 'Title',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  customtext(
                    onsaved: (data) {
                      subtitle = data;
                    },
                    hint: 'Content',
                    maxlen: 6,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  colorview(),
                  SizedBox(
                    height: 32,
                  ),
                  custombottom(
                    onTap: () {},
                    title: 'Add',
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]))));
  }
}
