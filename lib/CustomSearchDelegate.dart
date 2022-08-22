import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> allDigimonsSuggestions;

  CustomSearchDelegate({required this.allDigimonsSuggestions});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "1");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> allDigimons = allDigimonsSuggestions.where(
          (digimon) => digimon.toLowerCase().contains(
        query.toLowerCase(),
      ),
    ).toList();

    return ListView.builder(
        itemCount: allDigimons.length,
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            query = allDigimons[index];
            close(context, query);
          },
          title: Text(allDigimons[index]),
        ));
  }
}
