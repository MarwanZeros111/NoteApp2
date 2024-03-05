import 'package:flutter/material.dart';
import 'package:my_note_app/view/widget/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editNoteViewbody(),
    );
  }
}
