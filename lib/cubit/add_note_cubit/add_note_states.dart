abstract class AddNoteStates {}

class InitAddNoteState extends AddNoteStates {}

class AddNoteLoadingState extends AddNoteStates {}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteFailureState extends AddNoteStates {
  final String errMessage;

  AddNoteFailureState(this.errMessage);
}
