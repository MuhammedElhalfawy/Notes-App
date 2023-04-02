import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            if (kDebugMode) {
              print('Error is ${state.errMessage}');
            }
          }

          if (state is AddNoteSuccessState) {
            NotesCubit.get(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // AbsorbPointer بتخلي مينفعش يكتب اي حاجه في الفيلد طول ما هو بيحمل مهما تدوس مش هيكتب
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
