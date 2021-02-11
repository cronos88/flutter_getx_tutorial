import 'package:getx_tutorial/app/data/model/model.dart';
import 'package:getx_tutorial/app/data/providers/api.dart';
import 'package:meta/meta.dart';

//Repositório responsável pela entidade post !!
//lembrando que cada entidade que persiste de alguma forma com o banco de dados, seja ela uma api ou sqlite
//deve possuir um repositório excluisivo
class MyRepository {
  final MyApiClient apiClient;

  MyRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<MyModel>> getAll() {
    return apiClient.getAll();
  }
}
