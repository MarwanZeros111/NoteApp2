import 'package:bloc/bloc.dart';
import 'package:my_note_app/logic/AddNote/add_note_state.dart';
import 'package:my_note_app/sqld.dart';

class NoteCubit extends Cubit<NoteState> {
  Sqldb sqldb = Sqldb();
  List<Map> notes = [];
  NoteCubit() : super(NoteInitial());

  // Add methods for different actions (e.g., read, insert, delete, update)

  Future readData() async {
    try {
      List<Map> response = await sqldb.readData("SELECT * FROM 'notes'");
      notes.addAll(response);
      emit(NoteLoadSuccess(data: notes));
    } on Exception catch (e) {
      emit(NoteLoadFailure(error: e.toString()));
      // TODO
    }
  }

  // Add similar methods for insert, delete, update, etc.
}
