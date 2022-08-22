import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'model/Digimon.dart';
import 'package:http/http.dart' as http;

const String urlBase = 'https://www.digi-api.com/api/v1/digimon';

class API{
  Future <List<Digimon>>search (String digimonName) async{
    Uri url = Uri.parse('$urlBase?pageSize=1442/');
    http.Response response = await http.get(url);
    print('status: ${response.body}');
    Map<String, dynamic> dadosJson = json.decode(response.body);

    List<Digimon> digimon = dadosJson['content'].map<Digimon>((map) {
      return Digimon.fromJson(map);
    }).toList();
    for(var i = 0; i <1422; i++){
      print("n: ${digimon[i].name}");
    }

    // Close the IOSink to free system resources.
    /*Map<String, dynamic> dadosJson = json.decode(response.body);
    Digimon digimon = Digimon.fromJson(dadosJson);*/
    return digimon;
    }
}
