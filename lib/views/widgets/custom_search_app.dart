import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubit/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class CustomSearchApp extends StatelessWidget {
  const CustomSearchApp({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    List<NoteModel>? notesResult = query.isEmpty
        ? NotesCubit.get(context).notes
        : NotesCubit.get(context)
            .notes!
            .where(
              (element) =>
                  element.title.toLowerCase().startsWith(query.toLowerCase()) ||
                  element.subTitle
                      .toLowerCase()
                      .startsWith(query.toLowerCase()),
            )
            .toList();
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return FadeInRight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: notesResult!.isEmpty
                      ? const Center(
                          child: Text(
                            'No Data Found',
                          ),
                        )
                      : ListView.builder(
                          itemCount: notesResult.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: NoteItem(note: notesResult[index]),
                            );
                          }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
