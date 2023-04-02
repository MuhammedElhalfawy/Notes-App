import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_search_app.dart';

class NoteSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return CustomSearchApp(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return InkWell(
      onTap: () {
        showResults(context);
      },
      child: const Center(
        child: Text('Start Searching'),
      ),
    );
  }
}
