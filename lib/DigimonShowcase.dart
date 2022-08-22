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
      builder: (context, snapshot) => snapshot.hasData
          ? Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data!.name.toString(),
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InteractiveViewer(
                        child: Image(
                            image:
                                NetworkImage(snapshot.data!.image.toString())),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Type: ${snapshot.data!.type.toString()}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
