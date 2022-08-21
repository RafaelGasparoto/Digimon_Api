import 'package:flutter/material.dart';

import 'CustomSearchDelegate.dart';
import 'DigimonShowcase.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _result = res!;
              });
            },
            icon: const Icon(Icons.search),
            iconSize: 30,
            padding: const EdgeInsets.only(right: 20),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: DigimonShowcase(_result),
      ),
    );
  }
}
