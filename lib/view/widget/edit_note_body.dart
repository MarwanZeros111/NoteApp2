import 'package:flutter/material.dart';
import 'package:my_note_app/sqld.dart';
import 'package:my_note_app/view/widget/Text_field.dart';
import 'package:my_note_app/view/widget/custom_appbar.dart';

class editNoteViewbody extends StatefulWidget {
  const editNoteViewbody({
    super.key,
    this.title,
    this.subtitle,
    this.id,
    this.color,
  });
  final title;
  final subtitle;
  final id;
  final color;

  @override
  @override
  State<editNoteViewbody> createState() => _editNoteViewbodyState();
}

class _editNoteViewbodyState extends State<editNoteViewbody> {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  Sqldb sqldb = Sqldb();

  @override
  void initState() {
    title.text = widget.title;
    subtitle.text = widget.subtitle;

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            customAppBar(
              onpressed: () async {
                int response = await sqldb.ubdateData('''UPDATE notes
                SET 'note' = "${subtitle.text}", 'title' = "${title.text}",'color' = null
                WHERE id="${widget.id}" ''');
                if (response > 0) {
                  // Update the UI without restarting
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              text: 'Edit Note',
              ico: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            customtext(controller: title, hint: "title"),
            SizedBox(
              height: 20,
            ),
            customtext(
              controller: subtitle,
              hint: "content",
              maxlen: 7,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
