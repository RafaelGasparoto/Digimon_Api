import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> digimonsStandard;
  final List<String> allDigimons;

  CustomSearchDelegate({required this.digimonsStandard, required this.allDigimons});

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
    final List<String> digimons = digimonsStandard.where(
          (digimon) => digimon.toLowerCase().contains(
        query.toLowerCase(),
      ),
    ).toList();

    return ListView.builder(
        itemCount: digimons.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(digimons[index]),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> digimons = allDigimons.where(
          (digimon) => digimon.toLowerCase().contains(
        query.toLowerCase(),
      ),
    ).toList();

    return ListView.builder(
        itemCount: digimons.length,
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            query = digimons[index];
            close(context, query);
          },
          title: Text(digimons[index]),
        ));
  }
}
