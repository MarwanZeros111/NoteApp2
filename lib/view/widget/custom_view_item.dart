import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note_app/logic/AddNote/add_note_cubit.dart';
import 'package:my_note_app/logic/AddNote/add_note_state.dart';
import 'package:my_note_app/view/screens/edit_note_screen.dart';

class notesitem extends StatefulWidget {
  const notesitem({
    super.key,
  });

  @override
  State<notesitem> createState() => _notesitemState();
}

class _notesitemState extends State<notesitem> {
  @override
  Widget build(BuildContext context) {
    List<Map> notes = BlocProvider.of<NoteCubit>(context).notes;
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteLoadSuccess) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditNoteView();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 16, bottom: 24, top: 25),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 156, 77),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text(
                              '${notes[index]['note']}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                '${notes[index]['title']}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 106, 106),
                                    fontSize: 20),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                final noteIdToDelete = notes[index]['id'];
                                await BlocProvider.of<NoteCubit>(context)
                                    .sqldb
                                    .deleteData(
                                        'DELETE FROM notes WHERE id=$noteIdToDelete');

                                setState(() {
                                  notes.removeWhere((element) =>
                                      element['id'] == noteIdToDelete);
                                });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.trash,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 24, top: 10, bottom: 10),
                            child: Text(
                              "data",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 110, 106, 106)),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
