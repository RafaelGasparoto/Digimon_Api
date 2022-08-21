import 'dart:convert';
import 'package:flutter/material.dart';

import 'model/Digimon.dart';
import 'package:http/http.dart' as http;

const String urlBase = 'https://www.digi-api.com/api/v1/digimon';

class API{
  Future<Digimon>search (String digimonName) async{
    Uri url = Uri.parse('$urlBase/$digimonName');
    http.Response response = await http.get(url);

      Map<String, dynamic> dadosJson = json.decode(response.body);
      print('digi> ${dadosJson.toString()}');
      Digimon digimon = Digimon();
      digimon.imagem = dadosJson['images'][0]['href'].toString();
      print("image: ${digimon.imagem}");
      return digimon;
    }
}
