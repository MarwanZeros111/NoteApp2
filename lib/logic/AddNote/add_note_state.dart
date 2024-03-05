import 'package:equatable/equatable.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoadSuccess extends NoteState {
  final List<Map> data;

  const NoteLoadSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class NoteLoadFailure extends NoteState {
  final String error;

  const NoteLoadFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
