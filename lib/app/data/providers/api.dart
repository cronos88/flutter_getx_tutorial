// Getx Snipper - getprovider

import 'dart:convert';
import 'package:getx_tutorial/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

//nuestra URL base
const baseUrl = 'https://newsapi.org/v2/top-headlines?';
const apiKey = '40687e10967c4140996afa4bc9aad334';
const country = 'us';

//nuestra clase responsable de encapsular los métodos http
class MyApiClient {
//su cliente http, puede ser http, http.Client, dio, solo traiga sus métodos aquí y funcionarán normalmente: D
  final http.Client httpClient;
  MyApiClient({@required this.httpClient});

  //un ejemplo rápido, aquí estamos recuperando todas las publicaciones disponibles por api (100)
  Future<List<MyModel>> getAll() async {
    try {
      final url = '${baseUrl}country=$country&apiKey=$apiKey';
      print(url);
      var response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // print('resp ${jsonResponse}');
        final articles = jsonResponse['articles'];
        print('Articulos: ${articles.length}');
        List listMyModel =
            articles.map((model) => MyModel.fromJson(model)).toList();

        print(listMyModel.length);
        return listMyModel;
      } else
        print('erro');
      return [];
    } catch (_) {
      return [];
    }
  }
}
