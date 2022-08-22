import 'API.dart';
import 'package:flutter/material.dart';
import 'model/Digimon.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data!.name.toString(),
                        style: const TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InteractiveViewer(
                          child: Image(
                              image:
                                  NetworkImage(snapshot.data!.image.toString())),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Type',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              List<dynamic>? skills = snapshot.data!.skills;
                              String skill = skills![index]['skill'].toString();
                              return Text(
                                skill,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) =>
                            const Padding(padding: EdgeInsets.only(bottom: 15)),
                            itemCount: snapshot.data!.skills!.length,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            snapshot.data!.type.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
