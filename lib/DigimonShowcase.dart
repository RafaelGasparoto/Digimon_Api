import 'package:digimon/API.dart';
import 'package:flutter/material.dart';
import '../model/Digimon.dart';

class DigimonShowcase extends StatefulWidget {
  String search;

  DigimonShowcase(this.search, {super.key});

  @override
  State<DigimonShowcase> createState() => _DigimonShowcaseState();
}

class _DigimonShowcaseState extends State<DigimonShowcase> {
  Future<List<Digimon>> _searchDigimon(String digimonName) {
    API api = API();
    Future<List<Digimon>> digimon = api.search(digimonName);
    return digimon;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Digimon>>(
      future: _searchDigimon(widget.search),
      builder: (context, snapshot) => snapshot.hasData
          ? Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          image:
                              NetworkImage(""),
                      ))
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
