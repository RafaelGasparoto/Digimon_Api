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
  Future<Digimon> _searchDigimon(String digimonName) {
    API api = API();
    Future<Digimon> digimon = api.search(digimonName);
    return digimon;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Digimon>(
      future: _searchDigimon(widget.search),
      builder: (context, snapshot) =>
          snapshot.hasData ?
          ) : const CircularProgressIndicator(),
    );
  }
}
