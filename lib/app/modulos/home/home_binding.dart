import 'package:get/get.dart';
import 'package:getx_tutorial/app/data/providers/api.dart';
import 'package:getx_tutorial/app/data/repository/post_repository.dart';
import 'package:getx_tutorial/app/modulos/home/home_controller.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: MyRepository(
          apiClient: MyApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
  }
}
