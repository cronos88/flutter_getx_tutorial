import 'dart:convert';
import 'package:getx_tutorial/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

//nossa url base
const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

//nossa classe responsável por encapsular os métodos http
class MyApiClient {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient;
  MyApiClient({@required this.httpClient});

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<List<MyModel>> getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<MyModel> listMyModel =
            jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('erro');
      return [];
    } catch (_) {
      return [];
    }
  }
}
